python3 preprocess.py --dataset=spider --remove_from

GLOVE_PATH="/kaggle/working/glove.840B.300d.txt" # you need to change this
LOGDIR="logs_spider"

CUDA_VISIBLE_DEVICES=0 python3 run.py --raw_train_filename="data/spider_data_removefrom/train.pkl" \
          --raw_validation_filename="data/spider_data_removefrom/dev.pkl" \
          --database_schema_filename="data/spider_data_removefrom/tables.json" \
          --embedding_filename=$GLOVE_PATH \
          --data_directory="processed_data_spider_removefrom" \
          --input_key="utterance" \
          --use_schema_encoder=1 \
          --use_schema_attention=1 \
          --use_encoder_attention=1 \
          --use_schema_self_attention=1 \
          --use_schema_encoder_2=1 \
          --use_bert=1 \
          --bert_type_abb=uS \
          --fine_tune_bert=1 \
          --interaction_level=1 \
          --reweight_batch=1 \
          --freeze=1 \
          --train=1 \
          --logdir=$LOGDIR \
          --evaluate=1 \
          --evaluate_split="valid" \
          --use_predicted_queries=1

python3 postprocess_eval.py --dataset=spider --split=dev --pred_file $LOGDIR/valid_use_predicted_queries_predictions.json --remove_from