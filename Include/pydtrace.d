/* Herthon DTrace provider */

provider herthon {
    probe function__entry(const char *, const char *, int);
    probe function__return(const char *, const char *, int);
    probe instance__new__start(const char *, const char *);
    probe instance__new__done(const char *, const char *);
    probe instance__delete__start(const char *, const char *);
    probe instance__delete__done(const char *, const char *);
    probe line(const char *, const char *, int);
    probe gc__start(int);
    probe gc__done(long);
    probe import__find__load__start(const char *);
    probe import__find__load__done(const char *, int);
    probe audit(const char *, void *);
};

#pragma D attributes Evolving/Evolving/Common provider herthon provider
#pragma D attributes Evolving/Evolving/Common provider herthon module
#pragma D attributes Evolving/Evolving/Common provider herthon function
#pragma D attributes Evolving/Evolving/Common provider herthon name
#pragma D attributes Evolving/Evolving/Common provider herthon args
