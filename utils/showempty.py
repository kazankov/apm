import os, sys

def emptyFolders(path):
  if not os.path.isdir(path):
    return

  # remove empty subfolders
  files = os.listdir(path)
  if len(files):
    for f in files:
      fullpath = os.path.join(path, f)
      if os.path.isdir(fullpath):
        emptyFolders(fullpath)

  # if folder empty
  files = os.listdir(path)
  if len(files) == 0:
    print path
    #os.rmdir(path)

emptyFolders('.')
			#filename = os.path.join(dp, 'dummy.txt')
			#f = open(filename, 'w')
			#f.write('empty dir')
			#f.close()
		
