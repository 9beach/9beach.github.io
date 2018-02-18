# FIXME: Need to change this into git submodules. The code below is very bad.
#        As for now, you need to git clone each repo before using this.

cd ../../jech-set-theory-solutions; make; cd -
cd ../../hungerford-algebra-solutions; make; cd -
cd ../../munkres-topology-solutions; make; cd -

mkdir -p jech-set-theory-solutions hungerford-algebra-solutions munkres-topology-solutions

cp -f ../../jech-set-theory-solutions/*html jech-set-theory-solutions/
cp -f ../../hungerford-algebra-solutions/*html hungerford-algebra-solutions/
cp -f ../../munkres-topology-solutions/*html munkres-topology-solutions/

mv -f jech-set-theory-solutions/README.html jech-set-theory-solutions/index.html
mv -f hungerford-algebra-solutions/README.html hungerford-algebra-solutions/index.html
mv -f munkres-topology-solutions/README.html munkres-topology-solutions/index.html

# Poor dirty logic
for i in jech-set-theory-solutions/*html munkres-topology-solutions/*html hungerford-algebra-solutions/*html; do echo '---' > .math.tmp; echo 'title:' `grep '<title>' $i | sed -e 's:.*<title>:":' -e 's:</title>:":'` >> .math.tmp; echo 'layout: post\ncomments: true\n---\n' >> .math.tmp; echo '{% raw %}' >> .math.tmp; cat $i | sed -e 's:README.html:index.html:' -e 's:<style type="text/css">:&\
	p{font-family\: Georgia;}:' -e 's:\([0-9]\)\.html:\1:' >> .math.tmp; echo '{% endraw %}' >> .math.tmp; mv .math.tmp $i; done
