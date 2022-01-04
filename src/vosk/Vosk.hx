package vosk;

import cpp.RawConstPointer;
import cpp.ConstCharStar;

@:using(Vosk.Model)
@:native("VoskModel *")
@:include('vosk_api.h')
extern class Model {
	@:native("vosk_model_find_word")
	static function findWord(model:Model, word:ConstCharStar):Int;
	@:native("vosk_spk_model_free")
	static function free(model:Model):Void;
}

@:using(Vosk.SpkModel)
@:native("VoskSpkModel *")
@:include('vosk_api.h')
extern class SpkModel {
	@:native("vosk_spk_model_free")
	static function free(model:SpkModel):Void;
}

@:using(Vosk.Recognizer)
@:native("VoskRecognizer *")
@:include('vosk_api.h')
extern class Recognizer {
	@:native("vosk_recognizer_set_spk_model")
	static function setSpkModel(recognizer:Recognizer, spk_model:SpkModel):Void;
	@:native("vosk_recognizer_set_max_alternatives")
	static function setMaxAlternatives(recognizer:Recognizer, max_alternatives:Int):Void;
	@:native("vosk_recognizer_set_words")
	static function setWords(recognizer:Recognizer, words:Int):Void;
	@:native("vosk_recognizer_waveform")
	static function acceptWaveform(recognizer:Recognizer, data:ConstCharStar, length:Int):Int;
	@:native("vosk_recognizer_waveform_s")
	static function acceptWaveformS(recognizer:Recognizer, data:RawConstPointer<cpp.Int16>, length:Int):Int;
	@:native("vosk_recognizer_accept_waveform_f")
	static function acceptWaveformF(recognizer:Recognizer, data:RawConstPointer<cpp.Float32>, length:Int):Int;
	@:native("vosk_recognizer_result")
	static function result(recognizer:Recognizer):ConstCharStar;
	@:native("vosk_recognizer_partial_result")
	static function partialResult(recognizer:Recognizer):ConstCharStar;
	@:native("vosk_recognizer_reset")
	static function reset(recognizer:Recognizer):Void;
	@:native("vosk_recognizer_free")
	static function free(recognizer:Recognizer):Void;
}
@:include('vosk_api.h')
@:buildXml("<include name='${haxelib:vosk-bindings}/Build.xml'/>")
extern class Vosk {
	@:native("vosk_model_new")
	static function newModel(path:ConstCharStar):Model;
	@:native("vosk_spk_model_new")
	static function newSpkModel(model_path:ConstCharStar):SpkModel;
	@:native("vosk_recognizer_new")
	static function newRecognizer(model:Model, sample_rate:Single):Recognizer;
	@:native("vosk_recognizer_new_spk")
	static function newRecognizerSpk(model:Model, sample_rate:Single, spk_model:SpkModel):Recognizer;
	@:native("vosk_recognizer_new_grm")
	static function newRecognizerGrm(model:Model, sample_rate:Single, grammar:ConstCharStar):Recognizer;

	@:native("vosk_set_log_level")
	static function setLogLevel(log_level:Int):Void;

	@:native("vosk_gpu_init")
	static function initGpu():Void;
	@:native("vosk_gpu_thread_init")
	static function initGpuThread():Void;
}