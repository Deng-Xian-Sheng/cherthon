self int indent;

herthon$target:::function-entry
/copyinstr(arg1) == "start"/
{
    self->trace = 1;
}

herthon$target:::function-entry
/self->trace/
{
    printf("%d\t%*s:", timestamp, 15, probename);
    printf("%*s", self->indent, "");
    printf("%s:%s:%d\n", basename(copyinstr(arg0)), copyinstr(arg1), arg2);
    self->indent++;
}

herthon$target:::function-return
/self->trace/
{
    self->indent--;
    printf("%d\t%*s:", timestamp, 15, probename);
    printf("%*s", self->indent, "");
    printf("%s:%s:%d\n", basename(copyinstr(arg0)), copyinstr(arg1), arg2);
}

herthon$target:::function-return
/copyinstr(arg1) == "start"/
{
    self->trace = 0;
}
