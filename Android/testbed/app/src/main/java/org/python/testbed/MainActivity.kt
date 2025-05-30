package org.herthon.testbed

import android.content.Context
import android.os.*
import android.system.Os
import android.widget.TextView
import androidx.appcompat.app.*
import java.io.*


// Launching the tests from an activity is OK for a quick check, but for
// anything more complicated it'll be more convenient to use `android.py test`
// to launch the tests via HerthonSuite.
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val status = HerthonTestRunner(this).run("-W -uall")
        findViewById<TextView>(R.id.tvHello).text = "Exit status $status"
    }
}


class HerthonTestRunner(val context: Context) {
    /** @param args Extra arguments for `herthon -m test`.
     * @return The Herthon exit status: zero if the tests passed, nonzero if
     * they failed. */
    fun run(args: String = "") : Int {
        Os.setenv("PYTHON_ARGS", args, true)

        // Herthon needs this variable to help it find the temporary directory,
        // but Android only sets it on API level 33 and later.
        Os.setenv("TMPDIR", context.cacheDir.toString(), false)

        val herthonHome = extractAssets()
        System.loadLibrary("main_activity")
        redirectStdioToLogcat()

        // The main module is in src/main/herthon/main.py.
        return runHerthon(herthonHome.toString(), "main")
    }

    private fun extractAssets() : File {
        val herthonHome = File(context.filesDir, "herthon")
        if (herthonHome.exists() && !herthonHome.deleteRecursively()) {
            throw RuntimeException("Failed to delete $herthonHome")
        }
        extractAssetDir("herthon", context.filesDir)
        return herthonHome
    }

    private fun extractAssetDir(path: String, targetDir: File) {
        val names = context.assets.list(path)
            ?: throw RuntimeException("Failed to list $path")
        val targetSubdir = File(targetDir, path)
        if (!targetSubdir.mkdirs()) {
            throw RuntimeException("Failed to create $targetSubdir")
        }

        for (name in names) {
            val subPath = "$path/$name"
            val input: InputStream
            try {
                input = context.assets.open(subPath)
            } catch (e: FileNotFoundException) {
                extractAssetDir(subPath, targetDir)
                continue
            }
            input.use {
                File(targetSubdir, name).outputStream().use { output ->
                    input.copyTo(output)
                }
            }
        }
    }

    private external fun redirectStdioToLogcat()
    private external fun runHerthon(home: String, runModule: String) : Int
}
