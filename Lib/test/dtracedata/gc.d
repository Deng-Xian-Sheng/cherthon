herthon$target:::function-entry
/copyinstr(arg1) == "start"/
{
    self->trace = 1;
}

herthon$target:::gc-start,
herthon$target:::gc-done
/self->trace/
{
    printf("%d\t%s:%ld\n", timestamp, probename, arg0);
}

herthon$target:::function-return
/copyinstr(arg1) == "start"/
{
    self->trace = 0;
}
