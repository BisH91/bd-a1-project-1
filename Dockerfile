FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --break-system-packages pandas numpy seaborn matplotlib scikit-learn scipy pyarrow

RUN mkdir -p /home/doc-bd-a1

WORKDIR /home/doc-bd-a1

COPY twitterdata.parquet /home/doc-bd-a1/

CMD ["bash"]
