FROM python:3.8
ENV PATH=/root/.poetry/bin:$PATH

RUN apt-get update -y \
    && apt-get install zsh -y

ENV SHELL=/bin/zsh

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template /root/.zshrc
COPY .zshrc /root/.zshrc


RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/themes/powerlevel10k
COPY .p10k.zsh /.p10k.zsh

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python