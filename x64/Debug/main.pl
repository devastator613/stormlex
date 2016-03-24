open(STDOUT, '>', "test_lexer.bat") or die;

my $i;
print '@echo ' . "off \n";
for ($i = 1; $i <= 29; $i++ ){
	print "del result$i.txt
	lekser.exe test$i.in >> result$i.txt
	fc result$i.txt test$i.ans > nul
	if %ERRORLEVEL% EQU 0 (
	echo test$i OK
	) else (
	echo test$i FAIL
	)\n"
}
print 'pause';