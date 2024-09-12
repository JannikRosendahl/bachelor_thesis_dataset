This repo contains artifacts of the exploratory analysis. An important artifact of this repo is [initial_cleanup.sql](https://github.com/JannikRosendahl/bachelor_thesis_dataset/blob/master/sql/inital_cleanup.sql), this file contains preprocessing steps for the dataset.

Files with descriptions (in logical order):

1. [exploration_useful_cols.ipynb](https://github.com/JannikRosendahl/bachelor_thesis_dataset/blob/master/jupyter/exploration_useful_cols.ipynb)
    - This notebook iterates over all tables in the DB and finds columns with no variance.
    - These columns are dropped in [initial_cleanup.sql](https://github.com/JannikRosendahl/bachelor_thesis_dataset/blob/master/sql/inital_cleanup.sql).
    - Also looks for suitable "primary keys" for the event table, since the database does not define them.
2. [exploration_ben_vs_mal.ipynb](https://github.com/JannikRosendahl/bachelor_thesis_dataset/blob/master/jupyter/exploration_ben_vs_mal.ipynb)
    - This notebook explores class distribution, event type, distribution and sequence lengths of benign and malicious samples in the dataset.
    - The plots from this notebook are used in the thesis.
3. [seq_gen.ipynb](https://github.com/JannikRosendahl/bachelor_thesis_dataset/blob/master/jupyter/seq_gen.ipynb)
    - This notebook is used to create and fill the `sequence` table.
    - The sequence table holds information used to identify sequences in the `event` table and is used for the export later.
4. [seq_export.ipynb](https://github.com/JannikRosendahl/bachelor_thesis_dataset/blob/master/jupyter/seq_export.ipynb)
    - This notebook exports the sequences from the database to CSV files.
