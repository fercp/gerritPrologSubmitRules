Make change submittable only if Code-Review+2 is given by a non author
Add rule for Sonar Verification from jenkins

  $ git fetch origin refs/meta/config:config
  $ git checkout config
  ... edit or create the rules.pl file
  $ git add rules.pl
  $ git commit -m "My submit rules"
  $ git push origin HEAD:refs/meta/config
