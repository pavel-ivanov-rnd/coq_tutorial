FROM coqorg/coq:8.13.2 
RUN opam update \ 
    && opam upgrade --yes 
RUN opam pin add dune 2.8.0 --yes 
RUN sudo apt-get update \ 
    && sudo apt-get install -y libssl-dev \ 
    && sudo apt-get install -y emacs 
RUN emacs --batch --eval "(progn (require 'package) (setq gnutls-algorithm-priority \"NORMAL:-VERS-TLS1.3\") (add-to-list 'package-archives '(\"melpa\" . \"https://melpa.org/packages/\") t)  (package-initialize) (package-refresh-contents) (package-install 'proof-general))" 
 
RUN echo "(require 'package)(setq gnutls-algorithm-priority \"NORMAL:-VERS-TLS1.3\")(add-to-list 'package-archives '(\"melpa\" . \"https://melpa.org/packages/\") t) (package-initialize) (custom-set-variables '(package-selected-packages (quote (proof-general))))(custom-set-faces)(setq utf-translate-cjk-mode nil)(set-language-environment 'utf-8)(set-keyboard-coding-system 'utf-8-mac)(setq locale-coding-system 'utf-8)(set-default-coding-systems 'utf-8)(set-terminal-coding-system 'utf-8)(set-selection-coding-system (if (eq system-type 'windows-nt) 'utf-16-le 'utf-8))(prefer-coding-system 'utf-8)(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))" > ~/.emacs 

RUN sudo apt install wget

RUN mkdir Software_Foundations && cd Software_Foundations && \
    wget https://softwarefoundations.cis.upenn.edu/lf-current/lf.tgz   && tar -xzf lf.tgz  && rm lf.tgz && \
    wget https://softwarefoundations.cis.upenn.edu/plf-current/plf.tgz && tar -xzf plf.tgz && rm plf.tgz && \
    wget https://softwarefoundations.cis.upenn.edu/vfa-current/vfa.tgz && tar -xzf vfa.tgz && rm vfa.tgz && \
    wget https://softwarefoundations.cis.upenn.edu/qc-current/qc.tgz   && tar -xzf qc.tgz  && rm qc.tgz && \
    wget https://softwarefoundations.cis.upenn.edu/vc-current/vc.tgz   && tar -xzf vc.tgz  && rm vc.tgz && \
    wget https://softwarefoundations.cis.upenn.edu/slf-current/slf.tgz && tar -xzf slf.tgz && rm slf.tgz

CMD bash
