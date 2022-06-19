<template>
  <v-card
    class="mx-auto"
    max-width="344"
  >
    <v-card-text>
      <div>Word of the Day</div>
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
        @click="setRandomQuestion(); reveal = false"
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
</template>
<script>
  export default {
    name: 'HelloWorld',

    data: () => ({
      reveal: false,
      currentQuestion: 0,
      languageToDisplay: 1,
      questions: [
        {
            language1: 'How old are you?',
            language2: 'Kuinka vanha sina olet?',
            explanation: ''
        },
        {
            language1: 'What is your name?',
            language2: 'Mika sinun nimi on?',
            explanation: ''
        },
        {
            language1: 'How do you spell that?',
            language2: 'Miten se kirjoitetaan?',
            explanation: ''
        },
        {
            language1: 'Here/in here/in the vicinity',
            language2: 'Taalla',
            explanation: ''
        },
        {
            language1: 'Here/close enough to touch',
            language2: 'Tassa',
            explanation: ''
        },
        {
            language1: 'Good Morning',
            language2: 'Hyvaa Huomenta',
            explanation: ''
        },
        {
            language1: 'Good Day',
            language2: 'Hyvaa Paivaa',
            explanation: ''
        },
        {
            language1: 'Good evening',
            language2: 'Hyvaa iltaa',
            explanation: ''
        },
        {
            language1: 'Good Night',
            language2: 'Hyvaa Yota',
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
            language2: 'Hei hei, moikka, nahdaan, heippa, moi moi',
            explanation: ''
        },
        {
            language1: 'Today is Saturday, yesterday was friday and the day before was thursday',
            language2: 'Tanaan on lauantai, eilen oli Perjantai ja toissapaivana oli Torstai',
            explanation: ''
        },
        {
            language1: 'Today is Monday, tomorrow is Tuesday and the day after is Wednesday',
            language2: 'Tanaan on Maanantai, huommenna on Tiistai ja ylihuomenna on Keskiviikko',
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
            language2: 'Olen lauantaina toissa',
            explanation: ''
        },
        {
            language1: '157',
            language2: 'Sata viisikymmenta seitseman',
            explanation: ''
        },
        {
            language1: '1, 2, 3, 4, 5, 6, 7, 8, 9, 10',
            language2: 'Yksi, kaksi, kolme, nelja, viisi, kuusi, seitseman, kahdeksan, yhdeksan, kymmennen',
            explanation: ''
        },
        {
            language1: '11, 12, 13, 14, 15, 16, 17, 18, 19, 20',
            language2: 'Yksitoista, kaksitoista, kolmetoista, neljatoista, viisitoista, kuusitoista, seitsemantoista, kahdeksantoista, yhdeksantoista, kaksikymmenta',
            explanation: ''
        },
        {
            language1: 'Who are you? I am Harry',
            language2: 'Kuka sina olet? Mina olen Harry',
            explanation: ''
        },
        {
            language1: 'How are you? Fine thanks, and you?',
            language2: 'Mita sinulle kuuluu? Minulle kuuluu hyvaa kiitos, enta sinulle?',
            explanation: ''
        },
        {
            language1: 'How old are you? I am 33 years old',
            language2: 'Kuinka vanha sina olet? Mina olen kolmekymmenta kolme vuotta.',
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
            language2: 'Nahdaan huomenna',
            explanation: ''
        },
        {
            language1: 'When does the course start? It begins at 9 oclock',
            language2: 'Milloin kurssi alkaa? Se alkaa kello yhdeksan.',
            explanation: ''
        },
        {
            language1: 'How old is she?',
            language2: 'Kuinka vanha han on?',
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
            language2: 'Mika sinun etunimi on? Mika sinun sukunimi on?',
            explanation: ''
        },
        {
            language1: 'What is your phone number? My phone number is 01234',
            language2: 'Mika sinun puhelin numero on? Minun puhelin numero on 01234.',
            explanation: ''
        },
        {
            language1: 'What is her phone number? My phone number is 01234',
            language2: 'Mika hanen puhelin numero on? Hanen puhelin numero on 01234.',
            explanation: ''
        },
        {
            language1: 'Who is he?',
            language2: 'Kuka han on?',
            explanation: ''
        },
        {
            language1: 'Where are we? We are in London',
            language2: 'Missa me olemme? Me olemme Lontoonissa',
            explanation: ''
        },
        {
            language1: 'Where are they? They are in Helsinki',
            language2: 'Missa he ovat? He ovat Helsingissa',
            explanation: ''
        },
      ]
    }),

    mounted: function() {
      console.log('ready');
      this.setRandomQuestion();
    },
    
    methods: {
        setRandomQuestion: function(){
            this.currentQuestion = Math.floor(Math.random()*this.questions.length);
            this.languageToDisplay= Math.round(Math.random());
            console.log(this.currentQuestion, this.languageToDisplay);
        },
        getCurrentQuestion: function(){
            var obj = {question: '', answer: '', explanation: ''};
            if(this.languageToDisplay == 0){
                obj.question = this.questions[this.currentQuestion].language1;
                obj.answer = this.questions[this.currentQuestion].language2;
            }else{
                obj.question = this.questions[this.currentQuestion].language2;
                obj.answer = this.questions[this.currentQuestion].language1;
            }
            obj.explanation = this.questions[this.currentQuestion].explanation;
			return obj;
        }
    }
  }
</script>
