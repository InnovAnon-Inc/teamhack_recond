FROM python:latest

#COPY ./dist/         \
#  /tmp/dist/
#
#RUN pip install      \
#  /tmp/dist/*.whl    \
#&& rm -frv           \
#  /tmp/dist/
RUN pip install teamhack_recond

ENTRYPOINT [         \
  "/usr/bin/env",    \
  "python",          \
  "-m",              \
  "teamhack_recond"  \
]

