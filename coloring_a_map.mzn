%coloring a map of han's dinasty
enum COLOR = {GREEN, BLUE, PINK, YELLOW};
var COLOR: Si;
var COLOR: Yan;
var COLOR: Yu;
var COLOR: Xu;
var COLOR: Qing;
var COLOR: Ji;
var COLOR: You;
var COLOR: Bing;
var COLOR: Yong;
var COLOR: Liang;
var COLOR: Yi;
var COLOR: Jing;
var COLOR: Yang;
var COLOR: Jiao;

constraint Liang != Yong;
constraint Yong != Yi;
constraint Yong != Jing;
constraint Yong != Si;
constraint Yi != Jing;
constraint Yi != Jiao;
constraint Jiao != Jing;
constraint Jiao != Yang;
constraint Jing != Yang;
constraint Jing != Yong ;
constraint Jing != Si;
constraint Jing != Yu;
constraint Yang != Yu;
constraint Yang != Xu;
constraint Yu != Si;
constraint Yu != Yan;
constraint Yu != Xu;
constraint Xu != Yan;
constraint Xu != Qing;
constraint Yan != Si ;
constraint Yan != Ji;
constraint Yan != Qing;
constraint Yan != Yu;
constraint Qing != Ji ;
constraint Ji != Si;
constraint Si != Bing;
constraint Bing != Ji ;
constraint You != Bing ;
constraint You != Ji;

solve satisfy;

