function onUpdatePost()

   
    setPropertyFromClass("openfl.Lib", "application.window.title","Anti-cheat is on.")

    noteTweenX('note1',0,defaultPlayerStrumX3,2,'circOut')
    noteTweenX('note2',1,defaultPlayerStrumX2,2,'circOut')
    noteTweenX('note3',2,defaultPlayerStrumX0,2,'circOut')
    noteTweenX('note4',3,defaultPlayerStrumX1,2,'circOut')

    noteTweenX('altnote1',4,defaultOpponentStrumX2,2,'circOut')
    noteTweenX('altnote2',5,defaultOpponentStrumX3,2,'circOut')
    noteTweenX('altnote3',6,defaultOpponentStrumX1,2,'circOut')
    noteTweenX('altnote4',7,defaultOpponentStrumX0,2,'circOut')

end