# Working on Windows

## Command line basics

If this is you first time using the command prompt you might be interested by this section. The command prompt (often referred to as *terminal* in Linux world) is your interface to interact with the operating system and many available tools. To learn any useful scientific computing skills it is useful to get a grasp of its use because it is there that we will launch most applications. The illustrations below assume you are working under Windows, but the introductory commands are common to most operating systems.

Now let's launch a terminal. If you are working under VS Code you can use the shortcut to display the terminal `Ctrl+J`; the bottom of your window should display something as

```ps
PS D:\Kompanion>
```

The start of this line displays you *path* in the system; depending on your configuration that could not be the case and you can ask the OS to give you that with `pwd` (print working directory)

```ps
PS D:\Kompanion> pwd

Path
----
D:\Kompanion
```

If you are invited to move to directory `src` you may which to use command *change directory*, or `cd` in the system's language

```ps
PS D:\Kompanion> cd .\bin\
PS D:\Kompanion\bin>
```

Now that you reached your destination, you might be interested at inspecting the contents of this directory, *i.e.* listing its contents; that is done with `ls` as follows

```ps
PS D:\Kompanion\bin> ls


    Directory: D:\Kompanion\bin


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----         1/31/2025  11:11 AM                apps
d-----          2/3/2025   9:19 AM                data
d-----         1/30/2025   2:34 PM                downloads
d-----          2/3/2025  11:50 AM                pkgs
d-----         1/31/2025   9:33 AM                scripts
d-----         1/30/2025   9:58 AM                tests
-a----         1/31/2025   9:33 AM           2697 activate.bat
-a----         1/30/2025   9:58 AM            161 code.bat
-a----         1/30/2025   9:58 AM            132 kode.bat
-a----         1/30/2025   9:58 AM            131 kpip.bat
```

Oops! It was not the directory you wanted to go to! No problems, you can navigate *one-level-upwards* using the special symbol `..` (two dots) and change directory again

```ps
PS D:\Kompanion\bin> cd ..\docs\
PS D:\Kompanion\docs>
```

This is the minimum you need to know: navigate, know your address, inspect contents.

## Creating a portable launcher

A simple way to create a portable launcher requiring to source extra variables is by writing a simple batch script exporting or calling another script with the definitions:

```batch
@echo off

@REM Add variables to be sourced here such as
@REM set PATH="/path/to/some/dir";%PATH%
@REM ... or call another shared script doing so.
@REM call %~dp0\env

MyCode.exe
```

Because a batch script will keep a console window open, create a VB file with the following

```vb
Set oShell = CreateObject ("Wscript.Shell")
Dim strArgs
strArgs = "cmd /c MyCode.bat"
oShell.Run strArgs, 0, false
```

In the example we assume the program is called `MyCode.exe` and the batch script has been named in an analogous way `MyCode.bat`.

## Mount a network drive in WSL

Here we assume we will mount drive `Z:` at `/mnt/z`:

```bash
# Create the mount point (if required):
sudo mkdir /mnt/z

# Mount the network drive in WSL:
sudo mount -t drvfs Z: /mnt/z
```

Actually the same procedure can be used to access a SMB drive from within WSL temporarily with:

```bash
sudo mount -t drvfs '\\path\to\smb' /mnt/<mount-point>/
```

For automatic remount, consider adding the following to your `/etc/fstab`

```bash
//path/to/smb /mnt/<mount-point>/ drvfs auto,rw,nosuid,exec,uid=1000,gid=1000 0 0
```

## Following the writing to a file

This is equivalent to Linux `tail -f <file-path>`:

```bash
Get-Content -Path "<file-path>" -Wait
```

## Finding a process handle

This is useful when Windows won't let you move a file or folder because *it is already open somewhere*. First, download and extract [Handle](https://learn.microsoft.com/en-us/sysinternals/downloads/handle); from PowerShell run the following:

```bash
./handle.exe -u -nobanner "C:\Path\To\File.txt"
```

Notice that your file might have started another process and some research might be required.

## Identifying a proxy PEM

```bash
# List all root certs:
Get-ChildItem -Path Cert:\LocalMachine\Root

# Export a specific one:
$cert = Get-ChildItem -Path Cert:\LocalMachine\Root | Where-Object {
    $_.Subject -like "*<company-name-generally>*"
}
Export-Certificate -Cert $cert -FilePath "proxy.pem"
```