FROM kbase/sdkbase2:python

LABEL maintainer="scanon@lbl.gov"
# -----------------------------------------

# Insert apt-get instructions here to install
# any required dependencies for your module.

#RUN apt-get update && apt-get install -y wget

# -----------------------------------------

COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod 777 /kb/module

WORKDIR /kb/module

RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
