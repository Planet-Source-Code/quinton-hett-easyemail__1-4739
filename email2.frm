VERSION 5.00
Object = "{FFACF7F3-B868-11CE-84A8-08005A9B23BD}#1.7#0"; "DSSOCK32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   5715
   ClientLeft      =   4200
   ClientTop       =   3855
   ClientWidth     =   6630
   LinkTopic       =   "Form1"
   ScaleHeight     =   5715
   ScaleWidth      =   6630
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   960
      MultiLine       =   -1  'True
      TabIndex        =   8
      Top             =   3480
      Width           =   5055
   End
   Begin VB.TextBox Text4 
      Height          =   375
      Left            =   960
      TabIndex        =   7
      Top             =   3840
      Width           =   5055
   End
   Begin dsSocketLib.dsSocket dsSocket1 
      Height          =   420
      Left            =   1200
      TabIndex        =   6
      Top             =   2880
      Width           =   420
      _Version        =   65543
      _ExtentX        =   741
      _ExtentY        =   741
      _StockProps     =   64
      LocalPort       =   0
      RemoteHost      =   ""
      RemotePort      =   0
      ServiceName     =   ""
      RemoteDotAddr   =   ""
      Linger          =   -1  'True
      Timeout         =   10
      LineMode        =   0   'False
      EOLChar         =   10
      BindConnect     =   0   'False
      SocketType      =   0
   End
   Begin VB.ListBox List1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   1320
      MousePointer    =   99  'Custom
      Sorted          =   -1  'True
      TabIndex        =   3
      Top             =   1560
      Width           =   2055
   End
   Begin VB.TextBox Text3 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   1440
      TabIndex        =   2
      Top             =   1320
      Width           =   1815
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   1560
      TabIndex        =   1
      Top             =   1080
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   1560
      TabIndex        =   0
      Top             =   840
      Width           =   1335
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Height          =   300
      Left            =   3120
      MousePointer    =   99  'Custom
      TabIndex        =   5
      Top             =   1800
      Width           =   855
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Height          =   300
      Left            =   2040
      MousePointer    =   99  'Custom
      TabIndex        =   4
      Top             =   1800
      Width           =   855
   End
   Begin VB.Image Image1 
      Height          =   2220
      Left            =   0
      MousePointer    =   99  'Custom
      Picture         =   "email2.frx":0000
      Top             =   0
      Width           =   4170
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub moveform(Frm As Form)
'moves the form w/out a border
'ex:
'in mouse_up And mouse_down
'Call moveform(form1)

ReleaseCapture
ReturnVal% = SendMessage(Frm.hwnd, &HA1, 2, 0)
End Sub
Private Sub stayontop(Frm As Form)
'inside form load
'stayontop me

On Error Resume Next
Dim success%
success% = SetWindowPos(Frm.hwnd, HWND_TOPMOST, 0, 0, 0, 0, FLAGS)
End Sub


Private Sub dsSocket1_Connect()
dsSocket1.Send = "POST /moe3/signup/RegisterUser.cfm HTTP/1.1" & Chr(13) & Chr(10)
dsSocket1.Send = "Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-comet, */*" & Chr(13) & Chr(10)
dsSocket1.Send = "Referer: http://www.myownemail.com/moe3/signup/default.cfm" & Chr(13) & Chr(10)
dsSocket1.Send = "Accept-Language: en-us" & Chr(13) & Chr(10)
dsSocket1.Send = "Content-Type: application/x-www-form-urlencoded" & Chr(13) & Chr(10)
dsSocket1.Send = "Accept-Encoding: gzip, deflate" & Chr(13) & Chr(10)
dsSocket1.Send = "User-Agent: Mozilla/4.0 (compatible; MSIE 5.0; Windows 95; SPEED; DigExt)" & Chr(13) & Chr(10)
dsSocket1.Send = "Host: www.myownemail.com" & Chr(13) & Chr(10)
dsSocket1.Send = "Content-Length: " & Len(Text4) & "" & Chr(13) & Chr(10)
dsSocket1.Send = "Connection: Keep-Alive" & Chr(13) & Chr(10)
dsSocket1.Send = "" & Chr(13) & Chr(10)
dsSocket1.Send = Text4 & Chr(13) & Chr(10)
MsgBox "The data has been sent.  You can try to login at http://www.myownemail.com.  If you get an ''invalid'' password, it means that name you tried to register had already been made.", vbInformation, "Done."

Label1.MousePointer = 99
Label2.MousePointer = 99
Label1.Enabled = True
Label2.Enabled = True

End Sub

Private Sub dsSocket1_Receive(ReceiveData As String)
Text5 = Text5 & ReceiveData & vbCrLf
If InStr(ReceiveData, "OK") Then
'MsgBox "The data has been sent.  You can try to login at http://www.myownemail.com.  If you get an ''invalid'' password, it means that name you tried to register had already been made.", vbInformation, "Done."

Exit Sub
End If

End Sub

Private Sub Form_Load()
Form1.Width = Image1.Width
Form1.Height = Image1.Height
FormOnTop Me
Dim TheArea0&
TheArea0& = CreateRoundRectRgn(1, 1, 278, 148, 37, 37)
Call SetWindowRgn(Me.hwnd, TheArea0&, True)
'----

List1.AddItem "1musicrow.com"
List1.AddItem "1nysncfan.com"
List1.AddItem "ace-of-base.com"
List1.AddItem "backstreet-boys.com"
List1.AddItem "crazysexycool.com"
List1.AddItem "kornfreak.com"
List1.AddItem "metallicafan.com"
List1.AddItem "nirvanafan.com"
List1.AddItem "phil-collins.com"
List1.AddItem "sade.com"
List1.AddItem "smashing-pumpkins.com"
List1.AddItem "the-police.com"
List1.AddItem "the-eagles.com"
List1.AddItem "all-mychildren.com"
List1.AddItem "another-world.com"
List1.AddItem "babylon5fan.com"
List1.AddItem "bay-watch.com"
List1.AddItem "beverlyhills-90210.com"
List1.AddItem "friendsfan.com"
List1.AddItem "general-hospital.com"
List1.AddItem "heehaw.com"
List1.AddItem "imatrekkie.com"
List1.AddItem "melrose-place.com"
List1.AddItem "speed-racer.com"
List1.AddItem "sailormoonfan.com"
List1.AddItem "startrekave.com"
List1.AddItem "startreklane.com"
List1.AddItem "xfilesfan.com"
List1.AddItem "yada-yada.com"
List1.AddItem "dazedandconfused.com"
List1.AddItem "death-star.com"
List1.AddItem "earthalliance.com"
List1.AddItem "galaxy5.com"
List1.AddItem "marsattack.com"
List1.AddItem "over-the-rainbow.com"
List1.AddItem "pulp-fiction.com"
List1.AddItem "psicorps.com"
List1.AddItem "scifianime.com"
List1.AddItem "scififan.com"
List1.AddItem "starwarsave.com"
List1.AddItem "starwarsfan.com"
List1.AddItem "vorlonempire.com"
List1.AddItem "hehe.com"
List1.AddItem "ilovechocolate.com"
List1.AddItem "mr-potatohead.com"
List1.AddItem "o-tay.com"
List1.AddItem "quackquack.com"
List1.AddItem "rednecks.com"
List1.AddItem "smileyface.com"
List1.AddItem "your-house.com"
List1.AddItem "antisocial.com"
List1.AddItem "as-if.com"
List1.AddItem "beenhad.com"
List1.AddItem "canwetalk.com"
List1.AddItem "crazedanddazed.com"
List1.AddItem "dangerous-minds.com"
List1.AddItem "deal-maker.com"
List1.AddItem "for-president.com"
List1.AddItem "iamit.com"
List1.AddItem "iamwaiting.com"
List1.AddItem "ididitmyway.com"
List1.AddItem "imstressed.com"
List1.AddItem "ihavepms.com"
List1.AddItem "imneverwrong.com"
List1.AddItem "itookmyprozac.com"
List1.AddItem "ivebeenframed.com"
List1.AddItem "most-wanted.com"
List1.AddItem "married-not.com"
List1.AddItem "notme.com"
List1.AddItem "trust-me.com"
List1.AddItem "yeayea.com"
List1.AddItem "wouldilie.com"
List1.AddItem "baldandsexy.com"
List1.AddItem "buffbody.com"
List1.AddItem "cuteandcuddly.com"
List1.AddItem "cyberloveplace.com"
List1.AddItem "freeandsingle.com"
List1.AddItem "finebody.com"
List1.AddItem "girlofyourdreams.com"
List1.AddItem "guyofyourdreams.com"
List1.AddItem "heartthrob.com"
List1.AddItem "iamyours.com"
List1.AddItem "imtoosexy.com"
List1.AddItem "lookingforme.com"
List1.AddItem "lover-boy.com"
List1.AddItem "lovergirl.com"
List1.AddItem "onecooldude.com"
List1.AddItem "tellmeimcute.com"
List1.AddItem "toosexyforyou.com"
List1.AddItem "wetwetwet.com"
List1.AddItem "bruce-lee.com"
List1.AddItem "cindy-crawford.com"
List1.AddItem "heather-locklear.com"
List1.AddItem "mariah-carey.com"
List1.AddItem "sandra-bullock.com"
List1.AddItem "scott-wolf.com"
List1.AddItem "yasmine-bleeth.com"
List1.AddItem "bullsfan.com"
List1.AddItem "bullsgame.com"
List1.AddItem "dennis-rodman.com"
List1.AddItem "hang-ten.com"
List1.AddItem "jazzgame.com"
List1.AddItem "metsgame.com"
List1.AddItem "michaeljordanfan.com"
List1.AddItem "michaeljordon.com"
List1.AddItem "ohio-state.com"
List1.AddItem "packersfan.com"
List1.AddItem "pool-sharks.com"
List1.AddItem "sportsaddict.com"
List1.AddItem "sunsgame.com"
List1.AddItem "the18th.com"
List1.AddItem "thegolfcourse.com"
List1.AddItem "theraces.com"
List1.AddItem "theteebox.com"
List1.AddItem "tigerdrive.com"
List1.AddItem "winningteam.com"
List1.AddItem "1internetdrive.com"
List1.AddItem "1netdrive.com"
List1.AddItem "1webave.com"
List1.AddItem "1webhighway.com"
List1.AddItem "cyberbabies.com"
List1.AddItem "internetdrive.com"
List1.AddItem "mynetaddress.com"
List1.AddItem "netexecutive.com"
List1.AddItem "netexpressway.com"
List1.AddItem "netlimit.com"
List1.AddItem "netlane.com"
List1.AddItem "netspeedway.com"
List1.AddItem "pcpostal.com"
List1.AddItem "myownemail.com"
List1.AddItem "starmail.com"
List1.AddItem "supernetpower.com"
List1.AddItem "webave.com"
List1.AddItem "webjetters.com"
List1.AddItem "1coolplace.com"
List1.AddItem "1funplace.com"
List1.AddItem "1under.com"
List1.AddItem "anywhereusa.com"
List1.AddItem "cornerpub.com"
List1.AddItem "dontmesswithtexas.com"
List1.AddItem "earthdome.com"
List1.AddItem "end-war.com"
List1.AddItem "givepeaceachance.com"
List1.AddItem "hollywoodkids.com"
List1.AddItem "isellcars.com"
List1.AddItem "jazzandjava.com"
List1.AddItem "localbar.com"
List1.AddItem "moonman.com"
List1.AddItem "moonshinehollow.com"
List1.AddItem "starplace.com"
List1.AddItem "the-stock-market.com"
List1.AddItem "thevortex.com"
List1.AddItem "white-star.com"
List1.AddItem "for-president.com"
List1.AddItem "millionairetraining.com"
List1.AddItem "mostlysunny.com"
List1.AddItem "partlycloudy.com"
List1.AddItem "phayze.com"
List1.AddItem "positive-thinking.com"
List1.AddItem "rodrun.com"
List1.AddItem "rubyridge.com"
List1.AddItem "selin.com"
List1.AddItem "somethingorother.com"
List1.AddItem "spyring.com"
List1.AddItem "stopdropandroll.com"
List1.AddItem "sunrise-sunset.com"
List1.AddItem "the-any-key.com"
List1.AddItem "the-big-apple.com"
List1.AddItem "thelanddownunder.com"
List1.AddItem "the-lair.com"
List1.AddItem "the-pentagon.com"
List1.AddItem "tropicalstorm.com"
List1.AddItem "turnhere.com"
List1.AddItem "wolf-web.com"
List1.AddItem "yuppieintraining.com"
List1.AddItem "zahadum.com"
End Sub

Private Sub Image1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
FormDrag Me
End Sub

Private Sub Label1_Click()
On Error Resume Next
Label1.Enabled = False
Label2.Enabled = False
Label1.MousePointer = 11
Label2.MousePointer = 11
If List1.Text = "" Then Exit Sub
If Text1.Text = "" Then Exit Sub
If Text3.Text = "" Then Exit Sub
If Text2.Text = "" Then Exit Sub
If List1.Text = "1musicrow.com" Then a = "username=" & Text1 & "&R1=music&music=1musicrow.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "1nysncfan.com" Then a = "username=" & Text1 & "&R1=music&music=1nsyncfan.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "ace-of-base.com" Then a = "username=" & Text1 & "&R1=music&music=ace-of-base.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "backstreet-boys.com" Then a = "username=" & Text1 & "&R1=music&music=backstret-boys.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "crazysexycool.com" Then a = "username=" & Text1 & "&R1=music&music=crazysexycool.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "kornfreak.com" Then a = "username=" & Text1 & "&R1=music&music=kornfreak.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "metallicafan.com" Then a = "username=" & Text1 & "&R1=music&music=metallicafan.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "nirvanafan.com" Then a = "username=" & Text1 & "&R1=music&music=1musicrow.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "phil-collins.com" Then a = "username=" & Text1 & "&R1=music&music=phil-collins&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "sade.com" Then a = "username=" & Text1 & "&R1=music&music=sade.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "smashing-pumpkins.com" Then a = "username=" & Text1 & "&R1=music&music=smashing-pumpkins.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "the-police.com" Then a = "username=" & Text1 & "&R1=music&music=" & List1.Text & "&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "the-eagles.com" Then a = "username=" & Text1 & "&R1=music&music=the-eagles.com&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "all-mychildren.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "another-world.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "babylon5fan.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "bay-watch.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "beverlyhills-90210.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "friendsfan.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "general-hospital.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "heehaw.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "imatrekkie.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "melrose-place.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "speed-racer.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "sailormoonfan.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "startrekave.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "startreklane.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "xfilesfan.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "yada-yada.com" Then a = "username=" & Text1 & "&music=none&R1=tv&tv=" & List1.Text & "&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "dazedandconfused.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "death-star.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "earthalliance.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "galaxy5.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "marsattack.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "over-the-rainbow.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "pulp-fiction.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "psicorps.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "scifianime.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "scififan.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "starwarsave.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "starwarsfan.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "vorlonempire.com" Then a = "username=" & Text1 & "&music=none&tv=none&R1=movies&movies=" & List1.Text & "&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
'-------------
If List1.Text = "hehe.com" Then a = "username=" & Text1.Text & "&music=none&tv=none&movies=none&R1=funny&funny=" & List1.Text & "&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "ilovechocolate.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&R1=funny&funny=" & List1.Text & "&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "mr-potatohead.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&R1=funny&funny=" & List1.Text & "&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "o-tay.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&R1=funny&funny=" & List1.Text & "&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "quackquack.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&R1=funny&funny=" & List1.Text & "&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "rednecks.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&R1=funny&funny=" & List1.Text & "&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "smileyface.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&R1=funny&funny=" & List1.Text & "&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "your-house.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&R1=funny&funny=" & List1.Text & "&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
'-------------
If List1.Text = "antisocial.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "as-if.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "beenhad.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "canwetalk.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "crazedanddazed.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "dangerous-minds.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "deal-maker.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "forpresident.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "iamit.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "iamwaiting.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "ididitmyway.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "imstressed.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "ihavepms.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "imneverwrong.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "itookmyprozac.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "ivebeenframed.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "most-wanted.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "married-not.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "notme.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "trust-me.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "yeayea.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "wouldilie.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&R1=attitude&attitude=" & List1.Text & "&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
'-------------
If List1.Text = "baldandsexy.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "buffbody.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "cuteandcuddly.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "cyberloveplace.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "freeandsingle.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "finebody.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "girlofyourdreams.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "guyofyourdreams.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "heartthrob.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "iamyours.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "imtoosexy.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "lookingforme.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "lover-boy.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "lovergirl.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "onecooldude.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "tellmeimcute.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "toosexyforyou.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "wetwetwet.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&R1=sexy&sexy=" & List1.Text & "&celeb=none&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
'-------------
If List1.Text = "bruce-lee.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&R1=celeb&celeb=" & List1.Text & "&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "cindy-crawford.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&R1=celeb&celeb=" & List1.Text & "&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "heather-locklear.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&R1=celeb&celeb=" & List1.Text & "&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "mariah-carey.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&R1=celeb&celeb=" & List1.Text & "&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "sandra-bullock.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&R1=celeb&celeb=" & List1.Text & "&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "scott-wolf.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&R1=celeb&celeb=" & List1.Text & "&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "yasmine-bleeth.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&R1=celeb&celeb=" & List1.Text & "&sports=none&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
'-------------
If List1.Text = "bullsfan.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "bullsgame.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "dennis-rodman.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "hang-ten.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "jazzgame.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "metsgame.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "michaeljordanfan.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "michaeljordon.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "ohio-state.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "packersfan.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "pool-sharks.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "sportsaddict.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "sunsgame.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "the18th.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "thegolfcourse.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "theraces.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "theteebox.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "tigerdrive.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "winningteam.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&R1=sports&sports=" & List1.Text & "&cyber=none&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
'-------------
If List1.Text = "1internetdrive.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "1netdrive.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "1webave.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "1webhighway.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "cyberbabies.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "internetdrive.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "mynetaddress.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "netexecutive.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "netexpressway.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "netlimit.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "netlane.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "netspeedway.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "pcpostal.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "myownemail.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "starmail.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "supernetpower.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "webave.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "webjetters.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&R1=cyber&cyber=" & List1.Text & "&misc1=none&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
'-------------
If List1.Text = "1coolplace.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "1funplace.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "1under.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "anywhereusa.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "cornerpub.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "dontmesswithtexas.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "earthdome.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "end-war.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "givepeaceachance.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "hollywoodkids.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "isellcars.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "jazzandjava.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "localbar.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "moonman.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "moonshinehollow.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "starplace.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "the-stock-market.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "thevortex.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "white-star.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&R1=misc&misc1=" & List1.Text & "&misc2=none&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
'-------------
If List1.Text = "for-president.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "millionairetraining.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "mostlysunny.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "partlycloudy.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "phayze.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "positive-thinking.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "rodrun.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "rubyridge.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "selin.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "somethingorother.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "spyring.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "stopdropandroll.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "sunrise-sunset.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "the-any-key.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "the-big-apple.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "thelanddownunder.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "the-lair.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "the-pentagon.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "tropicalstorm.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "turnhere.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "wolf-web.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "yuppieintraining.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
If List1.Text = "zahadum.com" Then a = "username=" & Text1 & "&music=none&tv=none&movies=none&funny=none&attitude=none&sexy=none&celeb=none&sports=none&cyber=none&misc1=none&R1=misc2&misc2=" & List1.Text & "&from=your+owner&password=" & Text2 & "&type=web&REALNAME=your+owner&zip=90210&ref_email=" & Text3 & "&os=unknown&pur_online=no&age=unknown&income=unknown&chk1=Webmaster%3B741&date1=12%2F04%2F1999&ip=153.192.12.9&time1=05%3A33+PM&street=none&city=none&country=none&state=none"
'-------------
Text4 = a
dsSocket1.Close
dsSocket1.RemotePort = 80
dsSocket1.RemoteHost = "www.myownemail.com"
dsSocket1.Connect
End Sub

Private Sub Label2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
dsSocket1.Close

End
End Sub
