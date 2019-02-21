FROM kbase/sdkbase2:python

LABEL maintainer="scanon@lbl.gov"
# -----------------------------------------

# Insert apt-get instructions here to install
# any required dependencies for your module.

RUN apt-get update && wget

# -----------------------------------------

COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod 777 /kb/module

WORKDIR /kb/module

#RUN wget https://portal.nersc.gov/project/kbase/binaries/hipmer-v1.0-378.tgz && \
#	tar zxf hipmer-v1.0-378.tgz
#
#ENV PATH "/kb/module/hipmer-v1.0-378/bin:$PATH"

RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
