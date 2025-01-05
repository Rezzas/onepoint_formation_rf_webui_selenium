FROM ubuntu:latest

ENV ROBOT_UID=1000
ENV ROBOT_GID=1000
ENV ROBOT_WORK_DIR=/opt/onepoint_formation_rf_webui_selenium
ENV ROBOT_VENV=${ROBOT_WORK_DIR}_venv

# Install Python3
RUN apt-get update && \
    apt-get dist-upgrade && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    apt-get install -y python3-venv && \
    apt-get clean;

# Setup Python3 venv
RUN python3 -m venv ${ROBOT_VENV}
ENV PATH="${ROBOT_VENV}/bin:$PATH"
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN rm -f requirements.txt

RUN mkdir -p ${ROBOT_WORK_DIR} \
  && chown ${ROBOT_UID}:${ROBOT_GID} ${ROBOT_WORK_DIR} \
  && chmod ugo+w ${ROBOT_WORK_DIR}

# Allow any user to write logs
RUN chmod ugo+w /var/log \
  && chown ${ROBOT_UID}:${ROBOT_GID} /var/log

VOLUME ${ROBOT_WORK_DIR}

USER ${ROBOT_UID}:${ROBOT_GID}

ENTRYPOINT ["/bin/bash"]