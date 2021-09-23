FROM ermannobartoli99/sapienza-ml2021:latest

RUN mkdir src
WORKDIR src/
COPY . .

RUN pip3 install -r requirements.txt

WORKDIR /src/notebooks

ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

WORKDIR /src/notebooks
