FROM python:latest

#COPY ./dist/         \
#  /tmp/dist/
#
#RUN pip install      \
#  /tmp/dist/*.whl    \
#&& rm -frv           \
#  /tmp/dist/
RUN pip install teamhack_recond

WORKDIR  /var/teamhack
VOLUME ["/var/teamhack/etc"]

ENTRYPOINT [         \
  "/usr/bin/env",    \
  "python",          \
  "-m",              \
  "teamhack_recond"  \
]

