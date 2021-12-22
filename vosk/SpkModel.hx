package vosk;

@:keep
@:include('../lib/vosk-api/src/spk_model.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('spkmodel'))
#end
class SpkModel {
    @:native("SpkModel::SpkModel")
    function new(spk_path:String):Void;
    @:native("SpkModel::Ref")
    function ref():Void;
    @:native("SpkModel::Unref")
    function unref():Void;
}