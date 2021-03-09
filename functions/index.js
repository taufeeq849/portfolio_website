"use strict";

const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");

//to make it work you need gmail account
const gmailEmail = functions.config().gmail.email;
const gmailPassword = functions.config().gmail.password;

admin.initializeApp();

//creating function for sending emails
var goMail = function (name, email, message) {
  //transporter is a way to send your emails
  const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: gmailEmail,
      pass: gmailPassword,
    },
  });

  // setup email data with unicode symbols
  //this is how your email are going to look like
  const mailOptions = {
    from: gmailEmail, // sender address
    to: "taufeeq849@gmail.com", // list of receivers
    subject: "New Message from " + name, // plain text body
    html: "Email Address: " + email + "\n Message: " + message, // html body
  };

  //this is callback function to return status to firebase console
  const getDeliveryStatus = function (error, info) {
    if (error) {
      return console.log(error);
    }
    console.log("Message sent: %s", info.messageId);
    // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>
  };

  //call of this function send an email, and return status
  transporter.sendMail(mailOptions, getDeliveryStatus);
};

exports.sendMail = functions.firestore
  .document("Contact_Entries/{docID}")
  .onCreate((snap, context) => {
    const newMessage = snap.data();
    const name = newMessage.name;
    const email = newMessage.email;
    const message = newMessage.message;
    goMail(name, email, message);
  });
