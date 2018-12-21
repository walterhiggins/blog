# Just enough Java to load JavaScript

## 2013/02/08 17:26

This is just enough Java to load and run Javascript...

    import javax.script.*;
    public class jscript
    {
        public static void main(String[] args) throws Exception
        {
            ScriptEngineManager factory = new ScriptEngineManager();
            ScriptEngine engine = factory.getEngineByName("JavaScript");
            java.io.File file = new java.io.File(args[0]);
            engine.put("engine",engine);
            engine.put("args",args);
            engine.eval(new java.io.FileReader(file));
        }
    }

... JavaScript to Java: "That'll do Java - I'll take it from here."

## Categories
Java, JavaScript
