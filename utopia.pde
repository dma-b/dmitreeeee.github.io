//On each new question I output the data array to the console so it can be pasted here & used on the next start
String input = "Where are we?,How are you doing?,How do we change our existing structures without losing ourselves?,What would Utopia like to ask me?,r u real?,What did you always hope would come true in your life?,Do you always live in the future?,What can you see?,What role does nature play in Utopia?, Who will be in 40 years?,What should I ask you?,Is Utopia is the second name of Mother Nature?,?????????,When will we arrive?,Why?,how do we sense enough?,Does Utopia have rules?,Tackling the Ecological and Climate Emergency is a huge challenge for those of us who yearn for Utopia.  Discuss,Who is welcome in 'the' future ? Do we have space for future(s)?,does it matter?,Thank you,Is utopia method or place ? ,Can you appreciate Utopia without a Dystopia?,00101110111011?,Isn't it all OK?,How many questions are enough?,Why do we need to be healed?,Can you take me to Utopia?,Are we there yet?,Is Utopia singular or plural?,What is the future of listening,Why not?,Does Utopia have regrets?,What's the weather like in Utopia?,SOLARPUNK???,What is not utopian about this place?,What language is spoken in Utopia?,What even is utopia?,What would you like to ask Utopia?,How are you?,What should I do with myself in Utopia?,How much wine makes a Utopia?,Don't we all just want a cup of tea?,Safe is not talking?,How old is Utopia?,When?,Whats ur number ,How old r u ? ,asl?,In utopia... could I be a child forever???,How can we make this last longer?,Is utopia / does utopia (exist) in time ?,Do you pay the rent??,Have you cleaned your room?,But how is K.A.T.E. doing?,Does hope exist in utopia?,Do we care about hope in Utopia?,Does the past matter in Utopia?,What is the future of Utopia?,What is freedom in utopia?,Who isn't there?,Are we travelling?,Is healing travelling?,Dystopian literature in utopia?,Do people stop to smell the flowers in Utopia?,Will be still human/e,How do we imagine a future that exists beyond the Frame of social reproduction?,pic 4 pic?";



float uLim = 0.5; //upper limit of the speed of falling
int backgroundSpeed = .0020; //how quickly the background changes colour
int textHeight = 36; // height of the falling text in pixels
int textOpacity = 200; //255 is full opacity, 0 is transparent



String [] data = split(input,','); //Takes the input string and turns it into an array of questions
int amount = data.length;
Droplet[] drops = new Droplet[amount];


void setup() {
  size(window.innerWidth, window.innerHeight, P2D);
  textAlign(CENTER);
  textSize(textHeight);
  for (int i = 0; i < amount; i++) {
    drops[i] = new Droplet(data[i]); //assign data to each drop
  }
}

float R=125;
float centerR=125;
float pathR=125;
float a=PI/2;

float pathG=125;
float G=125;
float centerG=125;
float a1=PI;

float pathB=125;
float B=125;
float centerB=125;
float a2=3*PI/2;

void draw() {
  background(pathR,pathG,pathB);

  pathR=centerR+R*sin(a+=backgroundSpeed);
  pathG=centerG+G*sin(a1+=backgroundSpeed);
  pathB=centerB+B*sin(a2+=backgroundSpeed);

  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
}

void addText(String newQ) {
  data = append(data, newQ);
  console.log(data.toString());
  drop = append(drops, new Droplet(newQ))
}

class Droplet {
  float x;
  float y = 0;
  float pad;
  float yspeed;
  String question = "";

  Droplet(String textTemp) {
    if (textWidth(textTemp) < width) { //attempt to prevent text randomly being placed somewhere it goes offscreen
       pad  = textWidth(textTemp)/2;
    } else{
       pad = width/2;
    }

    x  = random(pad, width-pad);
    yspeed = random(0, uLim); //
    question = textTemp;
  }

  void fall() {
    y = y + yspeed;
    if (y > height + textHeight) { //if it goes off screen, reset it
      x  = random(pad, width-pad);
      y = 0;
      yspeed = random(0, uLim);
    }

    fill(255,textOpacity);
    text(question, x, y, y); //render it
  }
}
