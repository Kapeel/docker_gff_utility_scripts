# Gff utility scripts
# VERSION 1
#

FROM      ubuntu:latest
MAINTAINER Kapeel Chougule

LABEL Description="This repositary contains scripts to get summary statistics from Gff3 files"
RUN apt-get update && apt-get install -y build-essential wget curl apt-utils

#install git
RUN apt-get install --yes git

# install Genome_annotation from github repo
RUN git clone https://github.com/Kapeel/Genome_annotation.git
#RUN ["cp", "/Genome_annotation/*", "/usr/bin/" ]
WORKDIR /Genome_annotation
RUN ["cp", "look_at_transcripts.pl", "/usr/bin/" ]
RUN ["cp", "PostData.pm", "/etc/perl" ]
RUN ["cp", "gff3_annotation_stuff_b.pm", "/etc/perl" ]
ADD run_summary_script.sh /usr/bin/
RUN [ "chmod", "+x",  "/usr/bin/look_at_transcripts.pl" ]
RUN [ "chmod", "+x",  "/usr/bin/run_summary_script.sh" ]
ENTRYPOINT ["sh", "/usr/bin/run_summary_script.sh"]
