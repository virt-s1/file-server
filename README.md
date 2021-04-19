# File Server

The file server is based on webdav. It supports file download, upload, and folder creation.
But uploading file and creating folder needs basic authentication.

## How to deploy file server on Openshift

    $ oc login https://api.ocp4.prod.psi.redhat.com:6443 --token=<openshift token>
    $ oc project virt-qe-3rd
    $ oc process -f file-server-buildconfig-template.yaml | oc apply -f -

## How to work with file server

### How to download file from file server

    $ curl -o <file_name> http://file-server-virt-qe-3rd.apps.ocp4.prod.psi.redhat.com/<file_path + file_name>

### How to upload file to file server

    $ curl --basic --user '3rd-user:redhat' -T <upload_file> http://file-server-virt-qe-3rd.apps.ocp4.prod.psi.redhat.com/

### How to delete file on file server

    $ curl --basic --user '3rd-user:redhat' -X DELETE http://file-server-virt-qe-3rd.apps.ocp4.prod.psi.redhat.com/<file_path + file_name>

### How to create folder on file server

    $ curl --basic --user '3rd-user:redhat' -X MKCOL http://file-server-virt-qe-3rd.apps.ocp4.prod.psi.redhat.com/<folder>/
