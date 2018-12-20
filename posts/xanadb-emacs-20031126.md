# Emacs Skeletons
## 2003/11/26 10:00

Very often when writing Java Code you need to wrap a large block of
code inside a try-catch block. To do this in a mortal editor you move
the cursor to the start of the block and type 'try{' followed by
newline.  Then you've got to indent your block of code. Then goto the
end of the block and insert 'catch (Exception exception){' and newline
, then insert error handling code followed by newline and '}'.

If you use Emacs for editing java code, insert the following snippet
into your .emacs file.  To encase a block of unchecked code in a
try-catch block type 'Ctrl-t' followed by 'Ctrl-c'.  The try-catch
block will be correctly indented and the insertion-point will be ready
for typing error-handling code.


    ; ctrl t - ctrl c will wrap a try-catch block around the 
    ; selected text and move the point to the catch block ready 
    ; for inserting error-handling code 
    ;
    (define-skeleton try-catch-skel
      "enclose selected text in a try-catch block"
      nil  
      > "try{" \n  
      > _  
      \n "}catch(Exception exception){" >
      \n "// something went wrong ..."
      \n @ \n  "}">)
    (define-key java-mode-map "\C-t\C-c" 'try-catch-skel){@/esc@}</div>
    before:
    <div class="source">{@esc html@}package util;
    public class Test
    {
        public static void main(String [] args)
        {
            System.out.println( "this is a test\n");
            System.out.println( "of the try-catch-skel\n");
            System.out.println( "Emacs skeleton");
        } 
    }
    {@/esc@}</div>
    after:<div class="source">{@esc html@}package util;
    public class Test
    {
        public static void main(String [] args)
        {
            try{
                System.out.println( "this is a test\n");
                System.out.println( "of the try-catch-skel\n");
                System.out.println( "Emacs skeleton");
            }catch(Exception exception){
                // something went wrong 
                
            }
        } 
    }

Emacs Skeletons aren't documented in the Emacs Manual. 
To find out more , type 'apropos skeleton-insert'.

## Categories
Emacs
