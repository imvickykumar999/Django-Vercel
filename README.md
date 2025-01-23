> # `Git Connected`
>![image](https://github.com/user-attachments/assets/deb57f7c-765e-4150-a632-51385b1e7a83)

# `Window Git Bash`:

```bash
surface@LAPTOP-716KFR11 MINGW64 ~
$ cd "C:\Users\surface\Documents\GitHub\SSL Clone"

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone
$ eval "$(ssh-agent -s)"
Agent pid 805

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone
$ ssh-add ~/.ssh/id_rsa
Enter passphrase for /c/Users/surface/.ssh/id_rsa:
Identity added: /c/Users/surface/.ssh/id_rsa (imvickykumar999@gmail.com)

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone
$ cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3N....some random characters......nPU+w== imvickykumar999@gmail.com

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone
$ ssh -T git@github.com
The authenticity of host 'github.com (20.207.73.82)' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
Hi imvickykumar999! You've successfully authenticated, but GitHub does not provide shell access.

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone
$ git clone git@github.com:imvickykumar999/Django-Vercel.git
Cloning into 'Django-Vercel'...
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 4 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (4/4), done.

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone
$ cd Django-Vercel/

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone/Django-Vercel (main)
$ cat README.md
# Django-Vercel
I have added Licence file, any changes in code is welcome.

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone/Django-Vercel (main)
$ nano README.md
(make some changes in file then press CTRL+O to save, Enter to rename then CTRL+X to exit.)

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone/Django-Vercel (main)
$ git add .

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone/Django-Vercel (main)
$ git commit -m "Changed Readme file"
[main a865788] Changed Readme file
 1 file changed, 2 insertions(+), 1 deletion(-)

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone/Django-Vercel (main)
$ git push -u origin main
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 361 bytes | 361.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To github.com:imvickykumar999/Django-Vercel.git
   3af4c71..a865788  main -> main
branch 'main' set up to track 'origin/main'.

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone/Django-Vercel (main)
$ python -m venv venv

surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone/Django-Vercel (main)
$ source venv/Scripts/activate

(venv)
surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone/Django-Vercel (main)
$ pip install django

(venv)
surface@LAPTOP-716KFR11 MINGW64 ~/Documents/GitHub/SSL Clone/Django-Vercel (main)
$ "C:\Users\surface\Documents\GitHub\SSL Clone\Djan
go-Vercel\venv\Scripts\python.exe" -m pip install -
-upgrade pip
Requirement already satisfied: pip in c:\users\surface\documents\github\ssl clone\django-vercel\venv\lib\site-packages (21.2.3)
Collecting pip
  Using cached pip-24.3.1-py3-none-any.whl (1.8 MB)
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 21.2.3
    Uninstalling pip-21.2.3:
      Successfully uninstalled pip-21.2.3
Successfully installed pip-24.3.1
```

## **Steps:**

#### **1. Update `manage.py` to Expose WSGI/ASGI Application**
Vercel needs a `handler` variable or an `app` to serve the Django application. Update your `manage.py` file to expose the WSGI app:

Open `manage.py` and add the following lines at the bottom:

```python
import os
from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "your_project_name.settings")
app = get_wsgi_application()
```

Replace `your_project_name` with the name of your Django project (the folder containing `settings.py`).

---

#### **2. Verify the `vercel.json` Configuration**
Ensure your `vercel.json` is set to route all requests to `manage.py`. Here's an example:

```json
{
  "version": 2,
  "builds": [
    {
      "src": "manage.py",
      "use": "@vercel/python"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "manage.py"
    }
  ]
}
```

---

#### **3. Add a `requirements.txt` File**
Ensure all required dependencies are listed in `requirements.txt`. Example:

```plaintext
Django==4.2.5
gunicorn==21.2.0
```

Push this file to your GitHub repository.

---

#### **4. Add Static Files Settings**
In `settings.py`, add the following:

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
```

Then collect static files locally:
```bash
python manage.py collectstatic
```

Commit and push the changes to GitHub.

---

#### **5. Redeploy on Vercel**
1. Push your changes to the `main` branch of your GitHub repository.
2. Vercel will automatically deploy the latest changes.

---

#### **6. Check Vercel Logs**
After deployment, check the **Build Logs** and **Runtime Logs** in the Vercel dashboard for any errors. If errors persist, share the specific log messages for further debugging.
