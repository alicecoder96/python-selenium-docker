FROM python:3.9.4-buster
# Google Chrome
RUN wget https://dl.google.com/linux/linux_signing_key.pub
RUN apt-key add linux_signing_key.pub && \
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get install -y google-chrome-stable

# ChromeDriver
ADD https://chromedriver.storage.googleapis.com/93.0.4577.63/chromedriver_linux64.zip /opt/chrome/
RUN cd /opt/chrome/ && unzip chromedriver_linux64.zip

ENV PYTHONPATH "${PYTHONPATH}:/var/app/"

RUN pip install --upgrade pip
WORKDIR /var/app

RUN pip install --upgrade pip && \
     pip install pipenv
