import itertools
import pandas as pd

path_root = '/nas-ctm01/datasets/public/MEDICAL/MIMIC-CXR'
split_path = '/nas-ctm01/homes/fpcampos/dev/diffusion/medfusion/data/mimic-cxr-2.0.0-split.csv'

def main():
    metadata_labels = pd.read_csv(path_root + '/mimic-cxr-2.0.0-metadata.csv')
    metadata_labels = metadata_labels.loc[metadata_labels['ViewPosition'] == 'PA']

    chexpert_labels = pd.read_csv(path_root + '/mimic-cxr-2.0.0-chexpert.csv', index_col=['subject_id', 'study_id'])

    splits = pd.read_csv(split_path)

    labels = metadata_labels.merge(chexpert_labels, on="study_id", how="outer") # TODO: Rethink whether outer is necessary
    labels = labels.dropna(subset=["subject_id"])

    labels = labels.set_index("dicom_id")

    def get_path(row):
        dicom_id = str(row.name)
        subject = 'p' + str(int(row['subject_id'])) # todo: this is a lazy hack instead of properly changing column type
        study = 's' + str(int(row['study_id']))
        image_file = dicom_id + '.jpg'
        return '/files/'+subject[:3]+'/'+subject+'/'+study+'/'+image_file

    labels['Path'] = labels.apply(get_path, axis=1)

    for subject in labels['subject_id'].unique():
        subject_labels = labels[labels['subject_id'] == subject]
        
        paths = []
        for path in subject_labels['Path']:
            print(path)

if __name__ == "__main__":
    main()