# Giteki-Checker
Do you have Technical Conformity mark is attached to the wireless device you are using?
![alt text](https://github.com/a-nano/giteki-checker/blob/master/data/rei_giteki.png)

## Usage
```common-lisp
(giteki:check "018-160054")
=>("ELECOM CO.,LTD. " "‘æ‚Qğ‚P‚X†‚É‹K’è‚·‚é“Á’è–³üİ”õ"
 "M-IR07DR,M-FIR08DR,M-IR07DRS,M-FIR08DRS" "•½¬28”N4Œ21“ú")
```
## Installation

```bash
cd $HOME/quicklisp/local-projects
git clone https://github.com/a-nano/giteki-checker.git
```

Start your lisp. Then, just:

```common-lisp
(ql:quickload :giteki-checker)
```
## Author

* Akihide Nano (an74abc@gmail.com)

## Copyright

Copyright (c) 2016 Akihide Nano (an74abc@gmail.com)

## License

Licensed under the LLGPL License.
