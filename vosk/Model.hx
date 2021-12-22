package vosk;

import cpp.ConstPointer;
import cpp.Char;
@:keep
@:include('../lib/vosk-api/src/model.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('model'))
#end
extern class Model {
    // Char pointers are strings?
    // TODO: do correct typepath
    // I think they _are_ correct because my hover says they are :sunglasses:
    @:native("Model::Model")
    /* overload */ function new(model_path:ConstPointer<Char>):Void;
	
    @:native("Model::Ref") 
    function ref():Void;
    @:native("Model::Unref")
    function unref():Void;
    @:native("Model::FindWord")
    // Again, char pointers are strings?
	function findWord(word:ConstPointer<Char>):Int;
    // Protected afaik is basically private meaning idrc about it : )
    /*
	@:native("Model::~Model")
    @:protected 
    overload function new():Void;

    @:native("Model::ConfigureV1")
    @:protected
    function configureV1():Void;

    @:native("Model::ConfigureV2")
    @:protected
    function configureV2():Void;

    @:protected
    @:native("Model::ReadDataFiles")
    function readDataFiles():Void; 
    */
} // Model