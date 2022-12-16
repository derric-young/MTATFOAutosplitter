// Coded by Yunivers

state("stdrt")
{
    string255 gameName : "stdrt.exe", 0xB24E0, 0x0, 0x80, 0x0;
    int frame : "stdrt.exe", 0xB24BC, 0x1F0;
}

startup
{
    refreshRate = 60;
}

start
{
    vars.FromFiveorNine = 0;
    if (current.gameName == "Mac Tonight" && current.frame == 2)
        return true;
}

split
{
    if (current.frame == 5 || current.frame == 9)
        vars.FromFiveorNine = 1;
    else if (current.frame != -1 && current.frame != 7)
        vars.FromFiveorNine = 0;

    if (vars.FromFiveorNine == 1 && current.frame == 7 ||
        old.frame != 8 && current.frame == 8 ||
        old.frame != 10 && current.frame == 10 ||
        old.frame != 12 && current.frame == 12)
    {
        vars.FromFiveorNine = 0;
        return true;
    }
}

isLoading
{
    if (current.frame == -1 || current.frame == 3)
        return true;
    else return false;
}

reset
{
    if (current.gameName == "Mac Tonight" && current.frame == 6)
        return true;
}

// Reset and Custom Night Added by Derric. 