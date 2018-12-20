# Bees with machine guns! Low-cost, distributed load-testing using EC2. « News Apps Blog
## 2010/11/01 04:33:00 

<div class="posterous_bookmarklet_entry">
  <blockquote class="posterous_long_quote"><p>  The traditional load-testing tools we tried (<a href="http://httpd.apache.org/docs/2.0/programs/ab.html">ab</a>, <a href="http://httpd.apache.org/test/flood/">flood</a>, <a href="http://jakarta.apache.org/jmeter/">jmeter</a>, etc.), while often useful, suffered from a number of problems when trying to simulate this sort of event:</p>
<ul>
<li>Testing clients may have an operating system imposed maximum number of out-bound connections.</li>
<li>Testing a staging environment from a development workstation introduces network latency, firewalling, and traffic shaping as variables in the tests.</li>
<li>Testing from a single client will cause Amazon's Elastic Load Balancer to route all connections to a single application server, no matter how many are available. (so-called "sticky sessions")</li>
</ul>
<p>What we needed was a solution that allowed us to use multiple, topographically-close clients to all simultaneously assault our servers with traffic.</p>
<p>Put it another way, what we needed were <a href="http://github.com/newsapps/beeswithmachineguns"><em>bees with machine guns</em></a>.</p></blockquote>

<div class="posterous_quote_citation">via <a href="http://blog.apps.chicagotribune.com/2010/07/08/bees-with-machine-guns/">blog.apps.chicagotribune.com</a></div>
<p>Oh man. That's a really clever use of Amazon EC2 (though as Paul Watson points out in the comments - it probably won't work if you're load-testing something that's inside Amazon's cloud).</p></div>
