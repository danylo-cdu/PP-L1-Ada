const concurrency = 10;
const tasks = 80;

for (let BatchIndex = 1; BatchIndex <= Math.ceil((tasks / 2) / concurrency); BatchIndex++) {
    for (let I = 1; I <= concurrency; I++) {
        const absoluteIndex = ((BatchIndex -1) * concurrency) + I;
        if (absoluteIndex <= tasks / 2) {
            console.log(BatchIndex, I, ((BatchIndex -1) * concurrency) + I);
        }
    }
}

/*for BatchIndex in 1 .. (ProtectedWork.GetLenght / 2) / Concurrency loop
    -- Put_Line ("WorkLenght: "&Integer'Image (ProtectedWork.GetLenght)&", I: "&Integer'Image (I));
    -- TODO: this indeed creates a new thread. Semaphore latch only limits number of RUNNING processes. So we need to use a semaphore somewhere here to not spread idling threads

    for I in 1 .. Concurrency loop
        Workers(I) := new Simple_Task;
        Workers(I).Calculate (Index => I);
    end loop;
end loop;*/
