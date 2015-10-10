class test {

if (b || true)
	b = b && false;
else	b = !(b || true);

L: while (i != 0) {
	i = i*i/2; break L;
	i = i/(i-2); continue L
	++i;
	i++;
}

