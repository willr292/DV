
   Sample instruction.e file
   -------------------------
   This file provides the basic structure for the calc1 design instructions
   and also an example response checker for ADD instructions.

<'

type opcode_t : [ NOP, ADD, SUB, INV, INV1, SHL, SHR ] (bits:4);


struct instruction_s {

   %cmd_in : opcode_t;
   %din1   : uint (bits:32);
   %din2   : uint (bits:32);

   !resp   : uint (bits:2);
   !dout   : uint (bits:32);

   check_response(ins : instruction_s) is empty;

}; // struct instruction_s


extend instruction_s {

   // example check for correct addition
   when ADD'cmd_in instruction_s {

     check_response(ins : instruction_s) is only {

       if(ins.din1 + ins.din2 > 2147483647) {
          check that ins.resp == 02 else
          dut_error(appendf("[R==>Invalid response, should be 2 for overflow error<==R]\n \
          Instruction %s %d %d,\n \
          expected %02.2b \t %d,\n \
          received %02.2b \t %d.\n",
          ins.cmd_in, ins.din1, ins.din2,
          2,
          2,
          ins.resp,ins.resp));
          } else {

           check that ins.resp == 01;
           check that ins.dout == (ins.din1 + ins.din2) else
           dut_error(appendf("[R==>Incorrect answer.<==R]\n \
                              Instruction %s %d %d,\n \
                              expected %032.32b \t %d,\n \
                              received %032.32b \t %d.\n",
                              ins.cmd_in, ins.din1, ins.din2,
                              (ins.din1 + ins.din2),
                              (ins.din1 + ins.din2),
                              ins.dout,ins.dout));
          }

     }; // check_response

   }; // when

}; // extend instruction_s

extend instruction_s {

   // check for correct subtraction
   when SUB'cmd_in instruction_s {

     check_response(ins : instruction_s) is only {

       if(ins.din1 < ins.din2) {
          check that ins.resp == 02 else
          dut_error(appendf("[R==>Invalid response, should be 2 for underflow error<==R]\n \
          Instruction %s %d %d,\n \
          expected %02.2b \t %d,\n \
          received %02.2b \t %d.\n",
          ins.cmd_in, ins.din1, ins.din2,
          2,
          2,
          ins.resp,ins.resp));

          check that ins.dout == 0 else
          dut_error(appendf("[R==>Invalid output, should be 0 for an underflow.<==R]\n \
          Instruction %s %d %d,\n \
          expected %032.32b \t %d,\n \
          received %032.32b \t %d.\n",
          ins.cmd_in, ins.din1, ins.din2,
          0,
          0,
          ins.dout,ins.dout));

       } else {
          check that ins.resp == 01;
          check that ins.dout == (ins.din1 - ins.din2) else
          dut_error(appendf("[R==>Invalid output.<==R]\n \
                            Instruction %s %d %d,\n \
                            expected %032.32b \t %d,\n \
                            received %032.32b \t %d.\n",
                            ins.cmd_in, ins.din1, ins.din2,
                            (ins.din1 - ins.din2),
                            (ins.din1 - ins.din2),
                            ins.dout,ins.dout));
        }

     };

     }; // when

  }; // extend instruction_s

extend instruction_s {

   // check for correct left shift
   when SHL'cmd_in instruction_s {

     check_response(ins : instruction_s) is only {

       check that ins.resp == 01;
       check that ins.dout == (ins.din1 << ins.din2) else
       dut_error(appendf("[R==>Invalid output.<==R]\n \
                          Instruction %s %d %d,\n \
                          expected %032.32b \t %d,\n \
                          received %032.32b \t %d.\n",
                          ins.cmd_in, ins.din1, ins.din2,
                          (ins.din1 << ins.din2),
                          (ins.din1 << ins.din2),
                          ins.dout,ins.dout));

     };

     }; // when

  }; // extend instruction_s


extend instruction_s {

   // check for correct right shift
   when SHR'cmd_in instruction_s {

     check_response(ins : instruction_s) is only {

       check that ins.resp == 01;
       check that ins.dout == (ins.din1 >> ins.din2) else
       dut_error(appendf("[R==>Incorrect answer.<==R]\n \
                          Instruction %s %d %d,\n \
                          expected %032.32b \t %d,\n \
                          received %032.32b \t %d.\n",
                          ins.cmd_in, ins.din1, ins.din2,
                          (ins.din1 >> ins.din2),
                          (ins.din1 >> ins.din2),
                          ins.dout,ins.dout));

     };

     }; // when

  }; // extend instruction_s

  extend instruction_s {

     // check no response when no instruction given
     when NOP'cmd_in instruction_s {

       check_response(ins : instruction_s) is only {

         check that ins.resp == 00;
         check that ins.dout == 0 else
         dut_error(appendf("[R==>Should return 0.<==R]\n \
                            No Instruction,\n \
                            expected %032.32b \t %d,\n \
                            received %032.32b \t %d.\n",
                            0,
                            0,
                            ins.dout,ins.dout));

       };

       }; // when

    }; // extend instruction_s

    extend instruction_s {

       // check no response when no instruction given
       when INV'cmd_in instruction_s {

         check_response(ins : instruction_s) is only {

           check that ins.resp == 02;
           check that ins.dout == 0 else
           dut_error(appendf("[R==>Should return 0 for an invalid command.<==R]\n \
                              No Instruction,\n \
                              expected %032.32b \t %d,\n \
                              received %032.32b \t %d.\n",
                              0,
                              0,
                              ins.dout,ins.dout));

         };

         }; // when

      }; // extend instruction_s


'>
