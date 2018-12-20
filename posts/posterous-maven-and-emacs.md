# Maven and Emacs
## 2010/04/14 08:01:00 

<p>This is some lisp code <span style="text-decoration: line-through;">I whipped together</span> I tweaked to compile Java code using Maven, from within emacs. Copy and paste the code into your .emacs file, then from any Java buffer press</p>
<p>ALT+x mvn</p>
<p>...or for quick compiles press...</p>
<p>CTRL+c CTRL+x 5</p>
<p>The code starts here...</p>
<div class="CodeRay">
  <div class="code"><pre>(require 'compile)(defvar mvn-command-history nil  &quot;Maven command history variable&quot;)(defun mvnfast()  (interactive)  (let ((fn (buffer-file-name)))(let ((dir (file-name-directory fn)))  (while (and (not (file-exists-p (concat dir &quot;/pom.xml&quot;)))  (not (equal dir (file-truename (concat dir &quot;/..&quot;)))))(setq dir (file-truename (concat dir &quot;/..&quot;))))  (if (not (file-exists-p (concat dir &quot;/pom.xml&quot;)))  (message &quot;No pom.xml found&quot;)(compile (concat &quot;mvn -f &quot; dir &quot;/pom.xml install -Dmaven.test.skip=true&quot;))))))(define-key java-mode-map &quot;\C-c\C-x5&quot; 'mvnfast)(defun mvn(&amp;optional args)   &quot;Runs maven in the current project. Starting at the directoy where the file being vsisited resides, a search is   made for pom.xml recsurively. A maven command is made from the first directory where the pom.xml file is found is then displayed  in the minibuffer. The command can be edited as needed and then executed. Errors are navigate to as in any other compile mode&quot;  (interactive)  (let ((fn (buffer-file-name)))(let ((dir (file-name-directory fn)))  (while (and (not (file-exists-p (concat dir &quot;/pom.xml&quot;)))  (not (equal dir (file-truename (concat dir &quot;/..&quot;)))))(setq dir (file-truename (concat dir &quot;/..&quot;))))  (if (not (file-exists-p (concat dir &quot;/pom.xml&quot;)))  (message &quot;No pom.xml found&quot;)(compile (read-from-minibuffer &quot;Command: &quot;(concat &quot;mvn -f &quot; dir &quot;/pom.xml install -Dmaven.test.skip=true&quot;)nil nil 'mvn-command-history))))));; String pattern for locating errors in maven output. This assumes a Windows drive letter at the beginning(add-to-list 'compilation-error-regexp-alist '(&quot;^\\([a-zA-Z]:.*\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\]&quot; 1 2 3))</pre></div>
</div>

<p>Credit where it's due, this code is copied and tweaked from original code provided here ... <a href="http://vastusutra.blogspot.com/2007/06/getting-emacs-and-maven-2-to-play.html">http://vastusutra.blogspot.com/2007/06/getting-emacs-and-maven-2-to-play.html</a></p>

## Categories
emacs, maven, 