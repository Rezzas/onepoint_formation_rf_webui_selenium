FROM python:3.13.1-bookworm

ENV ROBOT_WORK_DIR=/opt/onepoint_formation_rf_webui_selenium

# Setup Env
COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

RUN rm -f requirements.txt

VOLUME ${ROBOT_WORK_DIR}

ENTRYPOINT ["/bin/bash"]