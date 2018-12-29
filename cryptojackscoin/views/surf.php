<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 19:16
 */
include_once ("view.php");

class SurfView extends View {

    public function showSurfBar(&$idUser) {

        include_once ("../models/surf.php");
        $modelSurf = new SurfModel();

        $website = $modelSurf->getWebsite($idUser);

        $this->set('website', $website);
        $this->set('captcha', $modelSurf->getCaptcha($idUser, $website['ID']));
        //render ...
        $this->render('head');
        $this->render('captcha');
        $this->render('footer');
    }

    /**
     * @param $data
     * $data: { id = integer }
     */
    public function showForm($data) {

        $this->set('idSponsor', $data['id']);
        //render ...
        $this->render('head');
        $this->render('formRegister');
        $this->render('footer');
    }

    /**
     * @param $data
     * $data: { id = integer, username = string, email = string(6, 256), wallet = string(34), country = integer, error = string }
     *
     */
    public function showFormWithError($data) {

        $this->set('idSponsor', $data['id']);
        $this->set('username',  $data['username']);
        $this->set('email',     $data['email']);
        $this->set('wallet',    $data['wallet']);
        $this->set('country',   $data['country']);
        $this->set('error',     $data['error']);
        //render ...
        $this->render('head');
        $this->render('formRegisterWithError');
        $this->render('footer');
    }

    /**
     *
     */
    public function showFormConfirmMail() {

        //render ...
        $this->render('head');
        $this->render('formConfirmMail');
        $this->render('footer');
    }

    /**
     *
     */
    public function showFormConfirmMailWithError() {

        //render ...
        $this->render('head');
        $this->render('formConfirmMailWithError');
        $this->render('footer');
    }

}