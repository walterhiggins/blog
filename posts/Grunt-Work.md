# Grunt-Work
## 2014/02/18 18:51

This is how much javascript code it takes to copy a directory tree 
ignoring temporary files ...

    var target = 'dist',
      copyIgnore = [ /~$/, /#$/ ];
    
    function ignoreEmacsTempFiles( content, srcPath ) { 
      var i;
      for (i = 0; i < copyIgnore.length; i++ ) {
        if ( srcPath.match( copyIgnore[i] ) ) {
          return false;
        }
      }
      return content;    
    }
    module.exports = function( grunt ) {
      grunt.initConfig({
        copy: {
          all: {
            options: {
              process: ignoreEmacsTempFiles,
              noProcess: ['**/*.{png,gif,jpg,ico,psd}']
            },
            files: [ { 
              expand: true, 
              dot: true, 
              cwd: '.', 
              dest: 'dist', 
              src: [ 'src/**' ]
            } ] 
          }
        }
      });
      grunt.loadNpmTasks('grunt-contrib-copy');
      grunt.registerTask('default', ['copy']);
    };

... There's a lot of buzz and activity around Node.js and its ecosystem, 
some of the innovations in node and the ecosystem are very very good. 
Others, not so much. Grunt feels like a throwback to the dark days of 
Maven and POM.XML files. Grunt has no built-in tasks so even a copy task 
requires you to install an additional npm module. That feels like plugin 
fetishism to me. When I first encountered [Rake][rk], it was a light-bulb 
moment. Rake is a brilliant example of an embedded DSL. The syntax is 
simple, you have a target, one or more sources and a block which when 
executed will build the target using the sources as input. This is the 
essence of any good build system. Grunt configs in contrast don't even 
look like a build file. Grunt feels more like Maven, it's self-regarding 
software. I've spent all day debugging Grunt just so I could figure out 
how to get it to ignore certain files when copying. That to me feels 
like Grunt-work.

[rk]: http://martinfowler.com/articles/rake.html

## Categories
grunt, nodejs, make, javascript