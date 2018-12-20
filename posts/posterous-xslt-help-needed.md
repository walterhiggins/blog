# XSLT help needed
## 2011/01/13 05:36:00 

<p>So I have an XML file that looks like this...</p>
<p style="padding-left: 30px;">&lt;?xml version="1.0" encoding="UTF-8"?&gt;<br />&lt;!DOCTYPE script SYSTEM "script.dtd"&gt;<br />&lt;script&gt;<br />&nbsp; &lt;description&gt;blah blah&lt;/description&gt;<br />&nbsp; &lt;statements&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp; &lt;modify&nbsp; remarks="xyz" /&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp; &lt;insert remarks="inserts" /&gt;<br />&nbsp; &lt;/statements&gt;<br />&lt;/script&gt;</p>
<p>... and I want to extract everything between the &lt;statements&gt; &lt;/statements&gt; elements so the output looks like this...</p>
<p style="padding-left: 30px;">&nbsp;&nbsp;&nbsp;&nbsp; &lt;modify&nbsp; remarks="xyz" /&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp; &lt;insert remarks="inserts" /&gt;</p>
<p>What should my XSLT stylesheet look like?</p>
<p>[update: it should look like this...]</p>
<p>&lt;?xml version="1.0" encoding="ISO-8859-1"?&gt;<br />&lt;xsl:stylesheet version="1.0"<br />xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;<br />&lt;xsl:output omit-xml-declaration="yes"/&gt;<br />&lt;xsl:template match="/"&gt;<br />&lt;xsl:copy-of select="script/statements/node()"/&gt;<br />&lt;/xsl:template&gt;<br />&lt;/xsl:stylesheet&gt;</p>
<p>Thanks to the helpful folks at <a href="http://stackoverflow.com/questions/586631/extract-a-subset-of-xml-file-using-xsl">StackOverflow</a>.</p>

## Categories
XSLT, 