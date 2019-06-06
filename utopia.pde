float uLim = 0.5;  //The max speed of the text
//String [] data = {"who?", "what?", "where?", "why?", "when?"};
String input = "Where are we?,How are you doing?,How do we change our existing structures without losing ourselves?,What would Utopia like to ask me?,r u real?,What did you always hope would come true in your life?,Do you always live in the future?,What can you see?,What role does nature play in Utopia?, Who will be in 40 years?,What should I ask you?,Is Utopia is the second name of Mother Nature?,?????????,When will we arrive?,Why?,how do we sense enough?,Does Utopia have rules?,Tackling the Ecological and Climate Emergency is a huge challenge for those of us who yearn for Utopia.  Discuss,Who is welcome in 'the' future ? Do we have space for future(s)?,does it matter?,Thank you,Is utopia method or place ? ,Can you appreciate Utopia without a Dystopia?,00101110111011?,Isn't it all OK?,How many questions are enough?,Why do we need to be healed?,Can you take me to Utopia?,Are we there yet?,Is Utopia singular or plural?,What is the future of listening,Why not?,Does Utopia have regrets?,What's the weather like in Utopia?,SOLARPUNK???,What is not utopian about this place?,What language is spoken in Utopia?,What even is utopia?,What would you like to ask Utopia?,How are you?,What should I do with myself in Utopia?,How much wine makes a Utopia?,Don't we all just want a cup of tea?,Safe is not talking?,How old is Utopia?,When?,Whats ur number ,How old r u ? ,asl?,In utopia... could I be a child forever???,How can we make this last longer?,Is utopia / does utopia (exist) in time ?,Do you pay the rent??,Have you cleaned your room?,But how is K.A.T.E. doing?,Does hope exist in utopia?,Do we care about hope in Utopia?,Does the past matter in Utopia?,What is the future of Utopia?,What is freedom in utopia?,Who isn't there?,Are we travelling?,Is healing travelling?,Dystopian literature in utopia?,Do people stop to smell the flowers in Utopia?,Will be still human/e,How do we imagine a future that exists beyond the Frame of social reproduction?,pic 4 pic?";
String [] data = split(input,',');

int amount = data.length;
int backgroundSpeed = 20;
textSize(50);


Drop[] drops = new Drop[amount];

void setup() {
  //size(1080, 720);
  size(window.innerWidth, window.innerHeight, P2D);
  textAlign(CENTER);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop(data[i%data.length]); //assign data to each drop
  }
}


float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;

void draw() {



  background(pathR,pathG,pathB);
  pathR=centerR+R*sin(a);
  a=a+.0001*backgroundSpeed;

  pathG=centerG+G*sin(a1);
  a1=a1+.0001*backgroundSpeed;

  pathB=centerB+B*sin(a2);
  a2=a2+.0001*backgroundSpeed;

  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
}

//==============================================
//==============================================
//==============================================

void addText(String newQ)
{
  data = append(data, newQ);
  console.log(data.toString());
  drop = append(drops, new Drop(newQ))
  //for (int i = 0; i < drops.length; i++) {
  //  drops[i] = new Drop(data[i%data.length]); //assign data to each drop
  //}
}



class Drop {
  float x;
  float y;
  float z;
  float a;
  float len;
  float yspeed;
  String textHolder = "";

  Drop(String textTemp) {
    if (textWidth(textTemp) < width) {
       a  = textWidth(textTemp)/2
    } else{
       a = width/2
    }
    x  = random(a, width-a);
    y  = random(-50, -5);
    len = map(z, 0, 20, 10, 20);
    yspeed = random(0, uLim); //
    textHolder = textTemp;
  }

  void fall() {
    y = y + yspeed;
    if (y > height) {
      x  = random(a, width-a);
      y = random(-100, -50);
      yspeed = random(0, uLim); //
    }
  }

  void show() {
    float thick = map(z, 0, 20, 1, 3);
    fill(255);
    text(textHolder, x, y, y+len);
  }
}
//
