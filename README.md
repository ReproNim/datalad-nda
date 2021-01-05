# datalad-nda
Playground for scripts to ease working with NDA via DataLad

# scripts/datalad-nda

The main script to populate a DataLad dataset based on a downloaded NDA
manifest.  It has been used to produce DataLad dataset for ABCD dataset.
Sample invocation:

    datalad-nda/scripts/datalad-nda add2datalad \
      -i <(xzcat ~/proj/abcd/datastructure_manifest.txt.xz) \
      -d testds-content3-part10 --drop-after -J10 --develn 10 --fast

to produce a sample (super)dataset with content downloaded and indexed by
git-annex, where only 10 files from a submission are downloaded.

Since GUIDs used by NDA are considered to be sensitive information, and
used in the filenames of the BIDS dataset, resultant dataset is not made
available publicly.  Work is ongoing to establish deposition of produced
datalad datasets back into NDA to provide access to researchers who have been
granted access to ABCD dataset.

Related issues:

- https://github.com/datalad/datalad/issues/5221
