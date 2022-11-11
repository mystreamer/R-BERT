rm -rf __pycache__
rm data/cached*
mv data/train.tsv data/train_lg.tsv
mv eval/answer_keys.txt eval/answer_keys_lg.txt
tail -n 128 data/train_lg.tsv > data/train.tsv
mv data/test.tsv data/test_lg.tsv
tail -n 32 data/test_lg.tsv > data/test.tsv
tail -n 32 eval/answer_keys_lg.txt > eval/answer_keys.txt
python3 main.py --do_train --do_eval --train_batch_size=8 --eval_batch_size=16 --model_name_or_path=distilbert-base-german-cased --num_train_epochs=1 --save_steps=16
rm data/test.tsv
rm data/train.tsv
rm eval/answer_keys.txt
mv data/train_lg.tsv data/train.tsv
mv data/test_lg.tsv data/test.tsv
mv eval/answer_keys_lg.txt eval/answer_keys.txt
