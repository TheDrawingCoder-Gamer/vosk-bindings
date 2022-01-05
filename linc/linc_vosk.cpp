#include <hxcpp.h>
#include "./linc_vosk.h"


namespace linc {
    namespace vosk {
        VoskModel *vosk_model_new(::String model_path) {
            return ::vosk_model_new(model_path.c_str());
        }

        void vosk_model_free(VoskModel *model) {
            ::vosk_model_free(model);
        }
        
        int vosk_model_find_word(VoskModel *model, ::String word) {
            return ::vosk_model_find_word(model, word.c_str());
        }

        VoskSpkModel *vosk_spk_model_new(::String model) {
            return ::vosk_spk_model_new(model.c_str());
        }

        void vosk_spk_model_free(VoskSpkModel *model) {
            ::vosk_spk_model_free(model);
        }

        VoskRecognizer *vosk_recognizer_new(VoskModel *model, float sample_rate) {
            return ::vosk_recognizer_new(model, sample_rate);
        }

        VoskRecognizer *vosk_recognizer_new_spk(VoskModel *model, float sample_rate, VoskSpkModel *spk_model) {
            return ::vosk_recognizer_new_spk(model, sample_rate, spk_model);
        }

        VoskRecognizer *vosk_recognizer_new_grm(VoskModel *model, float sample_rate, ::String grammar) {
            return ::vosk_recognizer_new_grm(model, sample_rate, grammar.c_str());
        }

        void vosk_recognizer_set_max_alternatives(VoskRecognizer *recognizer, int max_alternatives) {
            ::vosk_recognizer_set_max_alternatives(recognizer, max_alternatives);
        }

        void vosk_recognizer_set_words(VoskRecognizer *recognizer, int words) {
            ::vosk_recognizer_set_words(recognizer, words);
        }

        void vosk_recognizer_set_spk_model(VoskRecognizer *recognizer, VoskSpkModel *spk_model) {
            ::vosk_recognizer_set_spk_model(recognizer, spk_model);
        }

        int vosk_recognizer_accept_waveform(VoskRecognizer *recognizer, const char *data, int length) {
            return ::vosk_recognizer_accept_waveform(recognizer, data, length);
        }

        int vosk_recognizer_accept_waveform_s(VoskRecognizer *recognizer, const short *data, int length) {
            return ::vosk_recognizer_accept_waveform_s(recognizer, data, length);
        }

        int vosk_recognizer_accept_waveform_f(VoskRecognizer *recognizer, const float *data, int length) {
            return ::vosk_recognizer_accept_waveform_f(recognizer, data, length);
        }
        // TODO: String
        ::String vosk_recognizer_result(VoskRecognizer *recognizer) {
            const char *result = ::vosk_recognizer_result(recognizer);
            
            if (result) {
                ::String goodResult = ::String::create(result, -1);
                return goodResult;
            }

            return null();
        }

        ::String vosk_recognizer_partial_result(VoskRecognizer *recognizer) {
            // Anything not allocated with malloc doesn't need to be freed ? 
            const char *result = ::vosk_recognizer_partial_result(recognizer);
            
            if (result) {
                ::String goodResult = ::String::create(result, -1);
                return goodResult;
            }

            return null();
        }

        ::String vosk_recognizer_final_result(VoskRecognizer *recognizer) {
            const char *result = ::vosk_recognizer_final_result(recognizer);
            
            if (result) {
                ::String goodResult = ::String::create(result, -1);
                return goodResult;
            }

            return null();
        }

        void vosk_recognizer_reset(VoskRecognizer *recognizer) {
            ::vosk_recognizer_reset(recognizer);
        }

        void vosk_recognizer_free(VoskRecognizer *recognizer) {
            ::vosk_recognizer_free(recognizer);
        }

        void vosk_set_log_level(int log_level) {
            ::vosk_set_log_level(log_level);
        }

        void vosk_gpu_init() {
            ::vosk_gpu_init();
        }

        void vosk_gpu_thread_init() {
            ::vosk_gpu_thread_init();
        }
    }
}