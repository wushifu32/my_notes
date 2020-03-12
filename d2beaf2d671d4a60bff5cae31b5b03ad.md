command line - How to redirect stderr to a file - Ask Ubuntu

There are two main output streams in Linux (and other OSs), standard output (stdout) and standard error (stderr). Error messages, like the ones you show, are printed to standard error. The classic redirection operator (`command > file`) only redirects standard output, so standard error is still shown on the terminal. To redirect stderr as well, you have a few choices:

1.  Redirect stdout to one file and stderr to another file:
    
    ```
    command > out 2>error
    
    ```
    
2.  Redirect stdout to a file (`>out`), and then redirect stderr to stdout (`2>&1`):
    
    ```
    command >out 2>&1
    
    ```
    
3.  Redirect both to a file (this isn't supported by all shells, `bash` and `zsh` support it, for example, but `sh` and `ksh` do not):
    
    ```
    command &> out
    
    ```
    

For more information on the various control and redirection operators, see [here](https://unix.stackexchange.com/a/159514/22222).

id: d2beaf2d671d4a60bff5cae31b5b03ad
parent_id: 5bb5e1adeeaa4215a1eb5c85db224094
created_time: 2020-03-10T15:46:22.437Z
updated_time: 2020-03-10T15:46:22.437Z
is_conflict: 0
latitude: 0.00000000
longitude: 0.00000000
altitude: 0.0000
author: 
source_url: https://askubuntu.com/questions/625224/how-to-redirect-stderr-to-a-file
is_todo: 0
todo_due: 0
todo_completed: 0
source: joplin-desktop
source_application: net.cozic.joplin-desktop
application_data: 
order: 0
user_created_time: 2020-03-10T15:46:22.437Z
user_updated_time: 2020-03-10T15:46:22.437Z
encryption_cipher_text: 
encryption_applied: 0
markup_language: 1
is_shared: 0
type_: 1