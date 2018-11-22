--title A Quick Linux Command Line Tutorial
--author WANG Xiaolin <wx672ster@gmail.com>
--date Oct 02 2014

---
--center Hi, new programmer!
---
--center Welcome to Linux command line ---
---
--center The most powerful tool for hackers!
---

--center First time facing a terminal?
---
--center Don't worry.
---
--center As a beginner,
---
--center 10 commands are enough for you to
---
--center survive in this hacker's world.
---

--center Let me show you how...

--newpage directory tree
--heading Directory Tree
---
Assuming...
---
* I have a directory called 'homework' for saving my homeworks. So, I've got...
---
--beginoutput
/tmp
--revon
 └── homework
--revoff
     ├── c-homework
     │   └── hello.c
     └── python-homework
         ├── a.py
         ├── b.py
         └── hello.py
--endoutput
---
* See? A directory is just a place for keeping my files.
---
* In other systems, e.g. Windows, it's called a 'folder'. But, 
---
* in the UNIX world, we call it a 'directory'.
---

--revon
--center directory == folder
--revoff

--newpage ls
--heading ls & cd
To play around within directories, you just need 2 small commands...
---
* ls - list directory contents
* cd - change directory (get into a directory)
---

For example...
--beginshelloutput
$ cd /tmp/homework
/tmp/homework$
--endshelloutput
Now I am in /tmp/homework/ directory!

---
To see what's in /tmp/homework/ ...
--beginshelloutput
$ ls /tmp/homework
c-homework/  python-homework/
--endshelloutput
---

Or you can just type 'ls' if you're in /tmp/homework directory
--beginshelloutput
$ ls
c-homework/  python-homework/
--endshelloutput

--newpage ls & cd (cont)
--## heading ls & cd (cont)
Now, let's get into python-homework directory...
---
--beginshelloutput
$ cd python-homework
/tmp/homework/python-homework$
--endshelloutput

---
To see what's in it...
--beginshelloutput
$ ls
a.py  b.py  hello.py
--endshelloutput

---
List in a 'long' way...
--beginshelloutput
$ ls -l
total 0
-rw-r--r-- 1 wx672 wx672 0 Oct  2 18:12 a.py
-rw-r--r-- 1 wx672 wx672 0 Oct  2 18:12 b.py
-rw-r--r-- 1 wx672 wx672 0 Oct  2 18:11 hello.py
--endshelloutput

--newpage ls & cd (cont)
--## heading ls & cd (cont 2)
* Use 'pwd' to see where you are...
--beginshelloutput
$ pwd
/tmp/homework/python-homework
--endshelloutput

---
* '..' means parent directory...
--beginshelloutput
$ cd ..
/tmp/homework$
---
$ ls
c-homework/  python-homework/
--endshelloutput

--newpage mkdir
--heading mkdir
* To make a new directory...
--beginshelloutput
$ mkdir java-homework
$ ls
c-homework/  java-homework/  python-homework/
--endshelloutput

---
Let's make some more...
--beginshelloutput
$ mkdir Music Photo Movie
c-homework/  java-homework/  Movie/  Music/  Photo/  python-homework/
--endshelloutput
---
Easy as pie!

--newpage rm
--heading rm
* rm - remove a file
---

For example... 4 files in python-homework directory right now.
--beginshelloutput
$ ls python-homework
a.py  b.py  hello.py
--endshelloutput
---

Now, let's remove a.py...
---
--beginshelloutput
$ rm python-homework/a.py
/bin/rm: remove regular empty file ‘python-homework/a.py’? y
$ ls python-homework
b.py  hello.py
--endshelloutput
---
See? a.py is gone!

--newpage rm (cont)
To remove a directory, you should use 'rm -r'

For example,
---
--beginshelloutput
$ cd /tmp/homework
$ ls
c-homework/  java-homework/  Movie/  Music/  Photo/  python-homework/
$ rm -r c-homework java-homework
/bin/rm: remove directory ‘c-homework/’? y
/bin/rm: remove directory ‘java-homework/’? y
$ ls
Movie/  Music/  Photo/  python-homework/
--endshelloutput
Got the idea?

--newpage mv
--heading mv
* mv - move a file (rename a file)
---

For example, in my python-homework directory, there are 3 files...
--beginshelloutput
$ ls
b.py  hello.py
--endshelloutput

---
Now I want to give 'hello.py' a new name...
---
--beginshelloutput
$ mv hello.py hello-world.py
$ ls
b.py  hello-world.py
--endshelloutput
Easy, eh?

--newpage cp
--heading cp
* cp - copy file
---

Now, I want to make a copy of hello-world.py...
---
--beginshelloutput
$ cp hello-world.py hello.py
$ ls
b.py  hello.py  hello-world.py
--endshelloutput
---
See? Piece of cake!

--newpage dict
--heading dict
* dict - an English dictionary
---

--center Hate English?
---
--center Thanks to 'dict', life gets easier...
---
--beginshelloutput
$ dict hello
From WordNet (r) 3.0 (2006) [wn]:

  hello
      n 1: an expression of greeting; "every morning they exchanged
           polite hellos" [syn: {hello}, {hullo}, {hi}, {howdy}, {how-
           do-you-do}]

From Stardic English-Chinese Dictionary [stardic]:

  int. 喂,哈罗;
--endshelloutput
---
Hope it helps :)

--newpage end
--heading Have fun!
---
--beginshelloutput
$ Well, that's all for now.
---
$ It's still far from perfect. But...
---
$ you've know enough commands to do most of your daily work.
---
$ And, remember...
---
$ Practice makes perfect!
--endshelloutput
---

--beginslidebottom
--huge                        Have fun!
--endslidebottom
