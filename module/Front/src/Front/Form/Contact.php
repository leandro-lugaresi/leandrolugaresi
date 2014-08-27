<?php

namespace Front\Form;

use ModulusForm\Form\FormDefault;
use Zend\InputFilter;

class Contact extends FormDefault
{

    public function addElements()
    {

        $this->add(array(
            'name' => 'name',
            'options' => array(
                //'label' => 'Nome: ',
            ),
            'type' => 'Zend\Form\Element\Text',
            'attributes' => array(
                'placeholder' => 'Nome completo (Required)',
                'controls-class' => 'col-md-12',
            ),
        ));

        $this->add(array(
            'name' => 'email',
            'options' => array(
                //'label' => 'E-mail: ',
            ),
            'type' => 'Zend\Form\Element\Email',
            'attributes' => array(
                'placeholder' => 'E-mail de contato (Required)',
                'controls-class' => 'col-md-12',
            ),
        ));

        $this->add(array(
            'name' => 'message',
            'options' => array(
                //'label' => 'Mensagem: ',
            ),
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'placeholder' => 'Mensagem (Required)',
                'controls-class' => 'col-md-12',
            ),
        ));

        $this->add(new \Zend\Form\Element\Csrf('security'));

        $this->add(array(
            'name' => 'submit',
            'attributes' => array(
                'value' => 'Enviar',
                'type'  => 'submit',
                'class' => 'btn btn-primary',
            ),
        ));
    }

    public function addInputFilter()
    {
        $inputFilter = new InputFilter\InputFilter();

        $inputFilter->add(array(
            'name'       => 'name',
            'required'   => true,
            'validators' => array(
                array(
                    'name'    => 'StringLength',
                    'options' => array(
                        'min' => 3,
                        'max' => 200
                    ),
                ),
            ),
            'filters'   => array(
                array('name' => 'StringTrim'),
            ),
        ));

        $inputFilter->add(array(
            'name'       => 'email',
            'required'   => true,
            'validators' => array(
                array(
                    'name'    => 'StringLength',
                    'options' => array(
                        'min' => 3,
                        'max' => 200
                    ),
                ),
            ),
            'filters'   => array(
                array('name' => 'StringTrim'),
            ),
        ));

        $inputFilter->add(array(
            'name'       => 'message',
            'required'   => true,
            'filters'   => array(
                array('name' => 'StringTrim'),
            ),
        ));
        $this->setInputFilter($inputFilter);
    }
}
