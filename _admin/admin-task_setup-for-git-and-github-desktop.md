# **setup for git and github desktop**
___
To get started with Git and GitHub Desktop, **first install both applications.** **Then, link your GitHub account to the desktop application.** **Finally, configure Git with your username and email**, and you're ready to manage repositories locally and on GitHub. \[[1](https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/installing-github-desktop), [2](https://docs.github.com/en/get-started/getting-started-with-git/set-up-git), [3](https://www.youtube.com/watch?v=8Dd7KRpKeaE)\]

Here's a more detailed breakdown:

**1\. Install Git and GitHub Desktop:**

* **Git:** Download the latest version from the official Git website and follow the installation instructions. \[[2](https://docs.github.com/en/get-started/getting-started-with-git/set-up-git), [4](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git#:~:text=Installing%20on%20Windows%20There%20are%20also%20a,https://git%2Dscm.com/download/win%20and%20the%20download%20will%20start%20automatically.)\]  
* **GitHub Desktop:** Download the installer from the GitHub Desktop download page and run the installer. \[[1](https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/installing-github-desktop), [5](https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/setting-up-github-desktop)\]

**2\. Connect GitHub Account to GitHub Desktop:**

* Launch GitHub Desktop and sign in to your GitHub account.  
* You might be redirected to a browser for authentication.  
* Once authenticated, your repositories should be visible in the application. \[[3](https://www.youtube.com/watch?v=8Dd7KRpKeaE), [3](https://www.youtube.com/watch?v=8Dd7KRpKeaE), [6](https://www.simplilearn.com/how-to-use-github-desktop-tutorial-article), [6](https://www.simplilearn.com/how-to-use-github-desktop-tutorial-article), [7](https://www.youtube.com/watch?v=P8z4MEGcxh0&pp=0gcJCf0Ao7VqN5tD), [7](https://www.youtube.com/watch?v=P8z4MEGcxh0&pp=0gcJCf0Ao7VqN5tD), [8](https://m.youtube.com/watch?v=XL7okBQ_vmI), [8](https://m.youtube.com/watch?v=XL7okBQ_vmI)\]

**3\. Configure Git (if not already done):**

* Open a terminal or Git Bash (if installed).  
* Set your username: git config \--global user.name "eyeofparadox".  
* Set your email address: git config \--global user.email "david.b.roberson@gmail.com".  
* You can verify the configuration with git config \--list. \[[2](https://docs.github.com/en/get-started/getting-started-with-git/set-up-git), [9](https://github.com/git-guides/install-git), [9](https://github.com/git-guides/install-git), [10](https://www.nobledesktop.com/learn/git/setup-email#:~:text=To%20change%20the%20name%20linked%20to%20your,with%20your%20actual%20first%20and%20last%20name.), [11](https://graphite.dev/guides/how-to-configure-your-git-repository-with-the-git-config-command#:~:text=git%20config%20%2D%2Dglobal%20user.%20email%20%22your_email@example.com%22%20:,be%20replaced%20with%20your%20actual%20email%20address.), [12](https://github.blog/developer-skills/programming-languages-and-frameworks/what-is-git-our-beginners-guide-to-version-control/#:~:text=For%20now%2C%20we%20can%20check%20who%20Git,return%20the%20configuration%20options%20we%20just%20set.), [13](https://www.gitkraken.com/learn/git/git-download#:~:text=You%20can%20verify%20that%20you%20have%20configured,branch%20name%20as%20you%20entered%20them%20above.)\]

```
	david@DESKTOP-A1AQJMV MINGW64 ~
	$ git config --list
	diff.astextplain.textconv=astextplain
	filter.lfs.clean=git-lfs clean -- %f
	filter.lfs.smudge=git-lfs smudge -- %f
	filter.lfs.process=git-lfs filter-process
	filter.lfs.required=true
	http.sslbackend=schannel
	core.autocrlf=true
	core.fscache=true
	core.symlinks=true
	core.editor="C:\\PROGRAM FILES\\NOTEPAD++\\notepad++.exe" -multiInst -notabbar -nosession -noPlugin
	pull.rebase=false
	credential.helper=manager
	credential.https://dev.azure.com.usehttppath=true
	init.defaultbranch=main
	filter.lfs.required=true
	filter.lfs.clean=git-lfs clean -- %f
	filter.lfs.smudge=git-lfs smudge -- %f
	filter.lfs.process=git-lfs filter-process
	user.name=eyeofparadox
	user.email=david.b.roberson@gmail.com
```

**4\. Using GitHub Desktop:**

* **Cloning Repositories:** You can clone existing repositories from GitHub using their URLs within GitHub Desktop.  
* **Creating Repositories:** Create new repositories locally and then publish them to GitHub.  
* **Making Changes:** Edit files in your chosen code editor. GitHub Desktop will detect these changes.  
* **Committing Changes:** Stage the changes, add a commit message, and commit them to your local repository.  
* **Pushing Changes:** Push your local commits to the remote repository on GitHub. \[[3](https://www.youtube.com/watch?v=8Dd7KRpKeaE), [8](https://m.youtube.com/watch?v=XL7okBQ_vmI)\]

This video explains how to get started with Git and GitHub Desktop: [https://www.youtube.com/watch?v=8Dd7KRpKeaE](https://www.youtube.com/watch?v=8Dd7KRpKeaE)

*AI responses may include mistakes.*

\[1\] [https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/installing-github-desktop](https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/installing-github-desktop)  
\[2\] [https://docs.github.com/en/get-started/getting-started-with-git/set-up-git](https://docs.github.com/en/get-started/getting-started-with-git/set-up-git)  
\[3\] [https://www.youtube.com/watch?v=8Dd7KRpKeaE](https://www.youtube.com/watch?v=8Dd7KRpKeaE)  
\[4\] [https://git-scm.com/book/en/v2/Getting-Started-Installing-Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git#:~:text=Installing%20on%20Windows%20There%20are%20also%20a,https://git%2Dscm.com/download/win%20and%20the%20download%20will%20start%20automatically.)  
\[5\] [https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/setting-up-github-desktop](https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/setting-up-github-desktop)  
\[6\] [https://www.simplilearn.com/how-to-use-github-desktop-tutorial-article](https://www.simplilearn.com/how-to-use-github-desktop-tutorial-article)  
\[7\] [https://www.youtube.com/watch?v=P8z4MEGcxh0\&pp=0gcJCf0Ao7VqN5tD](https://www.youtube.com/watch?v=P8z4MEGcxh0&pp=0gcJCf0Ao7VqN5tD)  
\[8\] [https://m.youtube.com/watch?v=XL7okBQ\_vmI](https://m.youtube.com/watch?v=XL7okBQ_vmI)  
\[9\] [https://github.com/git-guides/install-git](https://github.com/git-guides/install-git)  
\[10\] [https://www.nobledesktop.com/learn/git/setup-email](https://www.nobledesktop.com/learn/git/setup-email#:~:text=To%20change%20the%20name%20linked%20to%20your,with%20your%20actual%20first%20and%20last%20name.)  
\[11\] [https://graphite.dev/guides/how-to-configure-your-git-repository-with-the-git-config-command](https://graphite.dev/guides/how-to-configure-your-git-repository-with-the-git-config-command#:~:text=git%20config%20%2D%2Dglobal%20user.%20email%20%22your_email@example.com%22%20:,be%20replaced%20with%20your%20actual%20email%20address.)  
\[12\] [https://github.blog/developer-skills/programming-languages-and-frameworks/what-is-git-our-beginners-guide-to-version-control/](https://github.blog/developer-skills/programming-languages-and-frameworks/what-is-git-our-beginners-guide-to-version-control/#:~:text=For%20now%2C%20we%20can%20check%20who%20Git,return%20the%20configuration%20options%20we%20just%20set.)  
\[13\] [https://www.gitkraken.com/learn/git/git-download](https://www.gitkraken.com/learn/git/git-download#:~:text=You%20can%20verify%20that%20you%20have%20configured,branch%20name%20as%20you%20entered%20them%20above.)  
\[14\] [https://www.youtube.com/watch?v=rMf11ideor0](https://www.youtube.com/watch?v=rMf11ideor0#:~:text=If%20you're%20just%20starting%20out%20or%20want,make%20software%20development%20easier%20and%20more%20efficient.)  
\[15\] [https://www.dataschool.io/git-and-github-videos-for-beginners/](https://www.dataschool.io/git-and-github-videos-for-beginners/#:~:text=So%20last%20week%2C%20I%20recorded%20a%20series,helped%20me%20when%20I%20was%20getting%20started.)  
\[-\] [https://github.com/Collaborative-AI/tutorial/blob/main/Git/README.md](https://github.com/Collaborative-AI/tutorial/blob/main/Git/README.md)

*Not all images can be exported from Search.*