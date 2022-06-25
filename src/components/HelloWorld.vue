<template>
    <v-container>
        <v-app-bar
          app
          color="primary"
          dark
        >
            <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>
            <v-toolbar-title>Suomen Mestari</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-btn
                href="https://github.com/hputus/suomen_mestari/"
                target="_blank"
                text
            >
                <v-icon>mdi-open-in-new</v-icon>
            </v-btn>
        </v-app-bar>
        <v-navigation-drawer
          v-model="drawer"
          absolute
          temporary
        >
            <v-list>
                <v-list-item-group
                    v-model="selectedCategory"
                    color="primary"
                >
                    <v-list-item
                      v-for="(item, i) in categories"
                      :key="i"
                    >
                        <v-list-item-content>
                            <v-list-item-title v-text="item.name + ' (' + item.questions.length + ')'"></v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                </v-list-item-group>
            </v-list>
        </v-navigation-drawer>
    
    
                <v-card
                    class="mx-auto"
                    max-width="344"
                  >
                    <v-card-text>
                      <p class="text-h4 text--primary">
                        {{ getCurrentQuestion().question }}
                      </p>
                    </v-card-text>
                    <v-card-actions>
                      <v-btn
                        text
                        color="teal accent-4"
                        @click="reveal = true"
                      >
                        Reveal Answer
                      </v-btn>
                      <v-btn
                        text
                        color="teal accent-4"
                        @click="setRandomQuestion(selectedCategory); reveal = false"
                      >
                        Next >>>
                      </v-btn>
                    </v-card-actions>

                    <v-expand-transition>
                      <v-card
                        v-if="reveal"
                        class="transition-fast-in-fast-out v-card--reveal"
                        style="height: 100%;"
                      >
                        <v-card-text class="pb-0">
                          <p class="text-h4 text--primary">
                            {{ getCurrentQuestion().answer }}
                          </p>
                          <p>{{ getCurrentQuestion().explanation }}</p>
                        </v-card-text>
                        <v-card-actions class="pt-0">
                          <v-btn
                            text
                            color="teal accent-4"
                            @click="reveal = false"
                          >
                            Close
                          </v-btn>
                        </v-card-actions>
                      </v-card>
                    </v-expand-transition>
                  </v-card>
            
    </v-container>
</template>
<script>
  export default {
    name: 'HelloWorld',

    data: () => ({
        reveal: false,
        drawer: false,
        currentQuestion: 0,
        languageToDisplay: 1,
        selectedCategory: 0,
        categories: [
            {
                name: 'Chapter 1',
                questions: [
                    {
                        language1: 'How old are you?',
                        language2: 'Kuinka vanha sinä olet?',
                        explanation: ''
                    },
                    {
                        language1: 'What is your name?',
                        language2: 'Mikä sinun nimi on?',
                        explanation: ''
                    },
                    {
                        language1: 'How do you spell that?',
                        language2: 'Miten se kirjoitetaan?',
                        explanation: ''
                    },
                    {
                        language1: 'Here/in here/in the vicinity',
                        language2: 'Täällä',
                        explanation: ''
                    },
                    {
                        language1: 'Here/close enough to touch',
                        language2: 'Tässä',
                        explanation: ''
                    },
                    {
                        language1: 'Good Morning',
                        language2: 'Hyvää Huomenta',
                        explanation: ''
                    },
                    {
                        language1: 'Good Day',
                        language2: 'Hyvää Päivää',
                        explanation: ''
                    },
                    {
                        language1: 'Good evening',
                        language2: 'Hyvää iltaa',
                        explanation: ''
                    },
                    {
                        language1: 'Good Night',
                        language2: 'Hyvää Yotä',
                        explanation: ''
                    },
                    {
                        language1: 'Sleep well',
                        language2: 'Nukku hyvin',
                        explanation: ''
                    },
                    {
                        language1: 'Ways of saying hello',
                        language2: 'Moi, Hei, Terve',
                        explanation: ''
                    },
                    {
                        language1: 'Ways of saying bye',
                        language2: 'Hei hei, moikka, nähdään, heippa, moi moi',
                        explanation: ''
                    },
                    {
                        language1: 'Today is Saturday, yesterday was friday and the day before was thursday',
                        language2: 'Tänään on Lauantai, eilen oli Perjantai ja toissapäivänä oli Torstai',
                        explanation: ''
                    },
                    {
                        language1: 'Today is Monday, tomorrow is Tuesday and the day after is Wednesday',
                        language2: 'Tänään on Maanantai, huommenna on Tiistai ja ylihuomenna on Keskiviikko',
                        explanation: ''
                    },
                    {
                        language1: 'Weekend',
                        language2: 'Viikonloppu',
                        explanation: ''
                    },
                    {
                        language1: 'Have a nice weekend',
                        language2: 'Hauskaa viikonloppua',
                        explanation: ''
                    },
                    {
                        language1: 'I am working on Saturday',
                        language2: 'Olen Lauantaina toissä',
                        explanation: ''
                    },
                    {
                        language1: '157',
                        language2: 'Sata viisikymmenta seitsemän',
                        explanation: ''
                    },
                    {
                        language1: '1, 2, 3, 4, 5, 6, 7, 8, 9, 10',
                        language2: 'Yksi, kaksi, kolme, neljä, viisi, kuusi, seitsemän, kahdeksan, yhdeksän, kymmennen',
                        explanation: ''
                    },
                    {
                        language1: '11, 12, 13, 14, 15, 16, 17, 18, 19, 20',
                        language2: 'Yksitoista, kaksitoista, kolmetoista, neljätoista, viisitoista, kuusitoista, seitsemäntoista, kahdeksantoista, yhdeksäntoista, kaksikymmenta',
                        explanation: ''
                    },
                    {
                        language1: 'Who are you? I am Harry',
                        language2: 'Kuka sinä olet? Minä olen Harry',
                        explanation: ''
                    },
                    {
                        language1: 'How are you? Fine thanks, and you?',
                        language2: 'Mitä sinulle kuuluu? Minulle kuuluu hyvää kiitos, entä sinulle?',
                        explanation: ''
                    },
                    {
                        language1: 'How old are you? I am 33 years old',
                        language2: 'Kuinka vanha sinä olet? Minä olen kolmekymmenta kolme vuotta.',
                        explanation: ''
                    },
                    {
                        language1: 'How do you spell that? It is spelt H-A-R-R-Y',
                        language2: 'Miten se kirjoitetaan? Se kirjoitetaan H-A-R-R-Y',
                        explanation: ''
                    },
                    {
                        language1: 'Nice to meet you! Thanks, same to you',
                        language2: 'Hauska tutustua! Kiitos samoin',
                        explanation: ''
                    },
                    {
                        language1: 'See you tomorrow',
                        language2: 'Nähdään huomenna',
                        explanation: ''
                    },
                    {
                        language1: 'When does the course start? It begins at 9 oclock',
                        language2: 'Milloin kurssi alkaa? Se alkaa kello yhdeksän.',
                        explanation: ''
                    },
                    {
                        language1: 'How old is she?',
                        language2: 'Kuinka vanha hän on?',
                        explanation: ''
                    },
                    {
                        language1: 'Teacher and student',
                        language2: 'Opettaja ja opiskelia',
                        explanation: ''
                    },
                    {
                        language1: 'How many students are on the course? There are 24 students on the course.',
                        language2: 'Kuinka monta opiskelijaa kursilla on? Kursilla on kaksikymmenta nelja opiskelijaa.',
                        explanation: ''
                    },
                    {
                        language1: 'What is your first name? What is your send name?',
                        language2: 'Mikä sinun etunimi on? Mikä sinun sukunimi on?',
                        explanation: ''
                    },
                    {
                        language1: 'What is your phone number? My phone number is 01234',
                        language2: 'Mikä sinun puhelin numero on? Minun puhelin numero on 01234.',
                        explanation: ''
                    },
                    {
                        language1: 'What is her phone number? My phone number is 01234',
                        language2: 'Mika hänen puhelin numero on? Hänen puhelin numero on 01234.',
                        explanation: ''
                    },
                    {
                        language1: 'Who is he?',
                        language2: 'Kuka hän on?',
                        explanation: ''
                    },
                    {
                        language1: 'Where are we? We are in London',
                        language2: 'Missä me olemme? Me olemme Lontoonissa',
                        explanation: ''
                    },
                    {
                        language1: 'Where are they? They are in Helsinki',
                        language2: 'Missä he ovat? He ovat Helsingissa',
                        explanation: ''
                    },
                ]
            },
            {
                name: 'Chapter 2',
                questions: [
                    {
                        language1: 'I am Pedro. I am Brazilian. I come from Brazil. My mother tongue is Portuguese. I speak Portuguese but I don\'t speak English.',
                        language2: 'Minä olen Pedro. Olen Brasilialainen. Olen kotoisin Brasiliasta. Minun äidinkieli on portugalia. Puhun portgulalia mutta en puhu englantia.',
                        explanation: ''
                    },
                    {
                        language1: 'Where are you from? I am from England.',
                        language2: 'Mistä sinä olet kotoisin? Olen kotoisin Englannista.',
                        explanation: 'Remember there is a \'sta\' in mista and so you add a \'sta\' to the country name'
                    },
                    {
                        language1: 'Which nationality are you? I am English.',
                        language2: 'Minkämaalainen sinä olet? Olen Englantilainen.',
                        explanation: ''
                    },
                    {
                        language1: 'What language do you speak? I speak Finnish.',
                        language2: 'Mitä kieltä sinä puhut? Puhun suomea.',
                        explanation: 'Use mitä because we are not using the olla verb. And kieltä (partitive) rather than kieli because its not countable. And suomea (partitive) because language is uncountable.'
                    },
                    {
                        language1: 'North, East, South, West',
                        language2: 'Pohjoinen, Itä, Etelä, Länsi',
                        explanation: ''
                    },
                    {
                        language1: 'Hi. What does the ice cream cost? One ball costs 2 euros and 2 balls costs 3 euros.',
                        language2: 'Hei. Mitä jäätelo maksaa? Yksi pallo maksaa kaksi euroa ja kaksi palloa maksaa kolme euroa.',
                        explanation: 'Mitä rather than mikä because you are not referring to olla verb. Kaksi palloa rather than pallo because you use partitive when counting more than 1 thing'
                    },
                    {
                        language1: 'Zero cars. One car. Two cars.',
                        language2: 'Nolla autoa. Yksi auto. Kaksi autoa.',
                        explanation: 'Use partitive when counting more than 1 thing or when its zero.'
                    },
                    {
                        language1: 'I would also like one ice cream',
                        language2: 'Minäkin haluaisin yksi jäätelo',
                        explanation: 'Minäkin - I also (as in me too). Haluan - I want. Haluaisin = I would like (more polite)'
                    },
                    {
                        language1: 'Here are the ice creams',
                        language2: 'Tässä ovat jäätelot',
                        explanation: 'Plural often adds a "t" to the end of words'
                    },
                    {
                        language1: 'What does this cost?',
                        language2: 'Mitä tämä maksaa?',
                        explanation: ''
                    },
                    {
                        language1: 'I speak. You speak. He speaks. We speak. You(pl.) speak. They speak',
                        language2: 'Puhun. Puhut. Puhuu. Puhumme. Puhutte. Puhuvat',
                        explanation: ''
                    },
                    {
                        language1: 'I don\'t speak. You don\'t speak. He doesn\'t speak. We don\'t speak. You(pl.) don\'t speak. They don\'t speak',
                        language2: 'en puhu. et puhu. ei puhu. emme puhu. ette puhu. eivät puhu',
                        explanation: 'Take off the last letter of the verb. And use the correct en/et/ei/emme/ette/eivät version of ei.'
                    },
                    {
                        language1: '\'What\' when the sentence ends with an olla verb e.g. ____ päivä tänään on?',
                        language2: 'Mikä',
                        explanation: ''
                    },
                    {
                        language1: '\'What\' when the sentence ends with something other than an olla verb e.g. ____ kieltä sinä puhut. ____ tama maksaa?',
                        language2: 'Mitä',
                        explanation: ''
                    },
                    {
                        language1: 'Why don\'t you speak Finnish?',
                        language2: 'Miksi sinä et puhu suomea',
                        explanation: ''
                    },
                    {
                        language1: 'Where are we? Where are we from? Where does this bus go? ',
                        language2: 'Missä me olemme? Mistä me olemme kotoisin? Mihin tämä bussi menee?',
                        explanation: ''
                    },
                    {
                        language1: 'What kind of book is this?',
                        language2: 'Millainen kirja tämä on?',
                        explanation: ''
                    },
                    {
                        language1: 'Are you Finnish? Do you speak Finnish? Don\'t you speak English?',
                        language2: 'Oletko suomalainen? Puhutko suomea? Etko puhu englantia?',
                        explanation: ''
                    },
                    {
                        language1: 'Do you live in Helsinki? Do they live in Helsinki?',
                        language2: 'Asutko Helsingissa? Asuvatko Helsingissa',
                        explanation: ''
                    },
                    {
                        language1: 'When conjugating verbs, what do kk, pp, tt, k, p, t, nk, nt, mp, lt, rt turn into?',
                        language2: 'What are the original letters that these replace when conjugating verbs? k, p, t, -, v, d, ng, nn, mm, ll, rr',
                        explanation: ''
                    },
                    {
                        language1: 'KPT: KK => ?, PP => ?, TT => ?, K => ?, P => ?, T = ?, NK => ?, NT => ?, NP => ??, LT=> ??, RT => ??',
                        language2: 'KPT: KK => K, PP => P, TT => T, K => -, P => V, T = D, NK => NG, NT => NN, NP => MM, LT=> LL, RT => RR',
                        explanation: '',
                        alwaysDisplayLanguage: 1
                    },
                    {
                        language1: 'Conjugate the verb: Turkki + ssa',
                        language2: 'What is the original verb here: Turkissa',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: viikko + lla',
                        language2: 'What is the original verb here: viikolla',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: Eurooppa + n',
                        language2: 'What is the original verb here: Euroopan',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: Lappi + ssa',
                        language2: 'What is the original verb here: Lapissa',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: Tytto + n',
                        language2: 'What is the original verb here: Tyton',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: planeetta + lla',
                        language2: 'What is the original verb here: planeetalla',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: ruoka + sta',
                        language2: 'What is the original verb here: ruoasta',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: Turku + ssa',
                        language2: 'What is the original verb here: Turussa',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: Kylpy + ssa',
                        language2: 'What is the original verb here: Kylvyssa',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: maito + ssa',
                        language2: 'What is the original verb here: maidossa',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: Helsinki + ssa',
                        language2: 'What is the original verb here: Helsingissa',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: aurinko + n',
                        language2: 'What is the original verb here: auringon',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: Islanti + sta',
                        language2: 'What is the original verb here: Islannista',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: Itavalta + ssa',
                        language2: 'What is the original verb here: Itavallassa',
                        explanation: ''
                    },
                    {
                        language1: 'Conjugate the verb: parta + sta',
                        language2: 'What is the original verb here: parrasta',
                        explanation: ''
                    },
                    {
                        language1: 'Where are Toshi and Akira from? They are from Tokyo, Japan.',
                        language2: 'Mistä Toshi ja Akira ovat kotoisin? He ovat kotoisin Tiokiosta, Japanista',
                        explanation: ''
                    },
                    {
                        language1: 'List the personal versions of this verb (me, you, he, we, you (pl.), they): Maksaa',
                        language2: 'Me: maksan, You: maksat, He: maksaa, We: maksamme, You(pl.): maksatte, They: maksavat',
                        explanation: ''
                    },
                    {
                        language1: 'He doesn\'t speak English',
                        language2: 'Hän ei puhu englantia',
                        explanation: ''
                    },
                    {
                        language1: 'I don\'t live in England',
                        language2: 'Minä en asu Englannissa',
                        explanation: ''
                    },
                    {
                        language1: 'We don\'t watch television',
                        language2: 'Me emme katso televisiota',
                        explanation: ''
                    },
                    {
                        language1: 'Why don\'t you go to Helsinki?',
                        language2: 'Miksi sinä et mene Helsingin?',
                        explanation: ''
                    },
                    {
                        language1: 'You (pl.) don\'t understand',
                        language2: 'Te ette ymmärrä',
                        explanation: ''
                    },
                    {
                        language1: 'Do you speak Italian? No I don\'t speak Italian',
                        language2: 'Puhutko sinä italiaa? Ei, minä en puhu italiaa',
                        explanation: ''
                    },
                    {
                        language1: 'Mikä or Mitä. "What is this?", "What day is it?", "What does this ice cream cost?"',
                        language2: 'Mikä tämä on? Mikä päivää tänään on? Mitä tämä jäätelo maksaa?',
                        explanation: '',
                        alwaysDisplayLanguage: 1
                    },
                ]
            }
        ]
    }),
    
    watch: {
        // whenever question changes, this function will run
        selectedCategory(newVal, oldVal) {
            console.log('new = ',newVal,'old = ',oldVal);
            
            if(newVal == undefined){
                newVal = oldVal;
                this.selectedCategory = newVal;
            }
            
            this.setRandomQuestion(newVal);
            this.reveal = false;
        }
    },

    mounted: function() {
      console.log('ready');
      this.setRandomQuestion(0);
    },
    
    methods: {
        setRandomQuestion: function(category){
            console.log(this.selectedCategory);
            this.currentQuestion = Math.floor(Math.random()*this.categories[category].questions.length);
            this.languageToDisplay= Math.round(Math.random());
            console.log(this.currentQuestion, this.languageToDisplay);
        },
        getCurrentQuestion: function(){
            var obj = {question: '', answer: '', explanation: ''};
            if(this.languageToDisplay == 0){
                obj.question = this.categories[this.selectedCategory].questions[this.currentQuestion].language1;
                obj.answer = this.categories[this.selectedCategory].questions[this.currentQuestion].language2;
            }else{
                obj.question = this.categories[this.selectedCategory].questions[this.currentQuestion].language2;
                obj.answer = this.categories[this.selectedCategory].questions[this.currentQuestion].language1;
            }
            obj.explanation = this.categories[this.selectedCategory].questions[this.currentQuestion].explanation;
            return obj;
        }
    }
  }
</script>
