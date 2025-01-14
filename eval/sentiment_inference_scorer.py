import argparse
import pandas as pd
from sklearn.metrics import classification_report

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('proposed_answers', type=str)
    parser.add_argument('answer_key', type=str)
    args = parser.parse_args()
 
    proposed_answers = pd.read_csv(args.proposed_answers, sep='\t', header=0, names=['id', 'label'], index_col=0)["label"].to_list()
    answer_key = pd.read_csv(args.answer_key, sep='\t', header=0, names=['id', 'label'], index_col=False)["label"].to_list()

    c_report = classification_report(answer_key, proposed_answers)

    print(c_report)
 
    c_report_dict = classification_report(answer_key, proposed_answers, output_dict=True)

    print(f"<<< The official score is (9+1)-way evaluation with directionality taken into account: macro-averaged F1 = { round(c_report_dict['macro avg']['f1-score'] * 100, 2) }% >>>")
